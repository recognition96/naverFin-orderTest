package com.navercorp.ordertest.service

import com.navercorp.ordertest.dto.PaymentsMethodRequest
import org.springframework.http.ResponseEntity

interface OrderService {

    fun getAccountInfo(userKey: String) : ResponseEntity<String>
    fun getCardInfo(requestParam: Map<String, String>) : ResponseEntity<String>
    fun getPaymentsMethod(requestParam : PaymentsMethodRequest) : ResponseEntity<String>
    fun submitPayment(requestParam : Map<String, Any>) : ResponseEntity<String>

    fun createOrder(newOrderId : String, paymentResponseBody: Map<String, Any>, pgType: String)
    fun createOrderDetail(newOrderId : String, itemData: List<Map<String, Any>>)
    fun createPaymentDetail(newOrderId: String, paymentResponseBody: Map<String, Any>, pgType: String)
}