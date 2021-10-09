package com.navercorp.ordertest.service

import com.google.gson.Gson
import com.navercorp.ordertest.dto.*
import com.navercorp.ordertest.mapper.OrderMapper
import mu.NamedKLogging
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.client.RestTemplate
import org.springframework.web.client.getForEntity
import org.springframework.web.client.postForEntity
import java.security.DigestException
import java.security.MessageDigest
import java.text.SimpleDateFormat
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.util.*
import kotlin.reflect.full.memberProperties

@Service
class OrderServiceImpl @Autowired constructor(val orderMapper: OrderMapper) : OrderService {
    companion object : NamedKLogging("TEXT_CONSOLE")

    override fun getAccountInfo(userKey: String): ResponseEntity<String> {
        val restTemplate = RestTemplate()
        val url = "https://API-URL?payMbrNo=${userKey}"

        return restTemplate.getForEntity(url, String::class)
    }

    override fun getCardInfo(requestParam: Map<String, String>): ResponseEntity<String> {
        val restTemplate = RestTemplate()
        val url = "https://API-URL"
        val salt = "sampleSalt"
        val curTime: Long = System.currentTimeMillis()
        val timeFormat = SimpleDateFormat("YYYY-MM-dd'T'HH:mm:ss")
        val requestTimestamp: String = timeFormat.format(Date(curTime))
        // validationHash 값 생성 규약
        val validationHash = hashSHA1(salt + requestTimestamp + requestParam["userKey"])

        val request = mapOf(
            "validationHash" to validationHash,
            "timestamp" to requestTimestamp,
            "naverPayMemberNo" to requestParam["userKey"]
        )
        return restTemplate.postForEntity(url, request, String::class)
    }

    override fun getPaymentsMethod(requestParam: PaymentsMethodRequest): ResponseEntity<String> {
        val restTemplate = RestTemplate()
        val url = "http://API-URL"
        return restTemplate.postForEntity(url, requestParam, String::class)
    }

    @Transactional
    override fun submitPayment(requestParam: Map<String, Any>): ResponseEntity<String> {
        val restTemplate = RestTemplate()

        val newOrderId: String = orderMapper.selectOrderKey()
        val newPaymentId = orderMapper.selectPaymentKey()
        val pgInfos: PgInfos = when (requestParam["method"]) {
            "OBANK" -> OBank(newPaymentId, requestParam)
            "OCREDIT" -> OCredit(newPaymentId, requestParam)
            else -> {
                return ResponseEntity
                    .ok()
                    .body(requestParam["method"].toString() + " is unknown payment method")
            }
        }
        val paymentsRequestPgInfos = mapOf(requestParam["method"].toString() to toMapFromFields(pgInfos))
        val itemData: List<Map<String, Any>> = requestParam["items"] as List<Map<String, Any>>
        val paymentsRequestItems = itemData.map { itemDataMap-> toMapFromFields(Item(newOrderId, itemDataMap)) }


        val paymentsRequest = PaymentsRequest(
            userId = requestParam["userId"].toString(),
            userKey = requestParam["userKey"].toString(),
            totalAmount = requestParam["totalAmount"].toString(),
            packageOrderNo = newOrderId,
            pgInfos =  paymentsRequestPgInfos,
            items = paymentsRequestItems
        )

        val url = "http://API-URL"
        val paymentResponse = restTemplate.postForEntity(url, paymentsRequest, String::class.java)
        val paymentResponseBody = Gson().fromJson(paymentResponse.body, Map::class.java) as Map<String, Any>

        if((paymentResponse.statusCodeValue == 200) && (paymentResponseBody["resultCode"] == "100")) {
            createOrder(newOrderId, paymentResponseBody, requestParam["method"] as String)
            createOrderDetail(newOrderId, itemData)
            createPaymentDetail(newOrderId, paymentResponseBody, requestParam["method"] as String)
            logger.info("Logging order/payment is complete.")
        }
        return paymentResponse
    }

    override fun createOrder(newOrderId: String, paymentResponseBody: Map<String, Any>, pgType: String) {
        val pgInfosInBody : Map<String, Any> = paymentResponseBody["pgInfos"] as Map<String, Any>
        val pgTypeInPgInfos : Map<String, Any> = pgInfosInBody[pgType] as Map<String, Any>
        val totalAmount= pgTypeInPgInfos["amount"] as Double

        val paymentDateTimeStr = paymentResponseBody["paymentDateTime"] as String
        val formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss")
        val paymentDateTime = LocalDateTime.parse(paymentDateTimeStr, formatter)

        val order = OrderDto(
            id = newOrderId.toInt(),
            totalCost = totalAmount.toInt(),
            orderDateTime = paymentDateTime
        )
        orderMapper.createOrder(order)
    }

    override fun createOrderDetail(newOrderId: String, itemData: List<Map<String, Any>>) {
        itemData.forEach{ item ->
            val orderDetail = OrderDetailDto(
                orderId = newOrderId.toInt(),
                itemId = item["id"] as Int,
                option1_value = item["option1_value"].toString(),
                option2_value = item["option2_value"].toString(),
                quantity = item["qty"].toString()
            )
            orderMapper.createOrderDetail(orderDetail)
        }
    }

    override fun createPaymentDetail(newOrderId: String, paymentResponseBody: Map<String, Any>, pgType: String) {
        val paymentDateTimeStr = paymentResponseBody["paymentDateTime"] as String
        val formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss")
        val paymentDateTime = LocalDateTime.parse(paymentDateTimeStr, formatter)

        val pgInfosInBody : Map<String, Any> = paymentResponseBody["pgInfos"] as Map<String, Any>
        val evidenceInfos = paymentResponseBody["evidenceInfos"] as List<Map<String, Any>>
        evidenceInfos.forEach{ evidence ->
            val paymentDetailDto = PaymentDetailDto(
                orderId = newOrderId.toInt(),
                pkgSeq = paymentResponseBody["pkgSeq"] as String,  // 빌링 묶음주문번호
                paymentDateTime = paymentDateTime,
                pgInfos = pgInfosInBody[pgType] as Map<String, Any>,
                evidenceInfos = evidence,
            )
            orderMapper.createPaymentDetail(paymentDetailDto)
        }

    }

    fun hashSHA1(src: String): String {
        val hash: ByteArray
        try {
            val md = MessageDigest.getInstance("SHA-1")
            md.update(src.toByteArray())
            hash = md.digest()
        } catch (e: CloneNotSupportedException) {
            throw DigestException("couldn't make digest of partial content");
        }

        return bytesToHex(hash)
    }

    fun bytesToHex(byteArray: ByteArray): String {
        val digits = "0123456789abcdef"
        val hexChars = CharArray(byteArray.size * 2)
        for (i in byteArray.indices) {
            val v = byteArray[i].toInt() and 0xff
            hexChars[i * 2] = digits[v shr 4]
            hexChars[i * 2 + 1] = digits[v and 0xf]
        }
        return String(hexChars)
    }

//    fun <T> T.toMap(): Map<String, Any> {
//        return convert()
//    }
//
//    private inline fun <T, reified R> T.convert(): R {
//        val json = Gson().toJson(this)
//        return Gson().fromJson(json, object : TypeToken<R>() {}.type)
//    }

    fun toMapFromFields(instance : Any) : Map<String, Any> {
        var json = "{"
        instance::class.memberProperties.forEach {
            json += "\"${it.name}\":"
            json += "\"${it.getter.call(instance)}\","
        }
        json = json.dropLast(1)
        json += "}"
        return Gson().fromJson(json, Map::class.java) as Map<String, Any>
    }
}
