package com.navercorp.ordertest.dto

data class PaymentsRequest(
    val chnl: String = "NV",               // 고정값
    val userId: String,
    val userKey: String,
    val clientType: String = "NPAY_ORDER", // 고정값
    val device: String = "PC",             // 고정값
    val packageOrderNo: String,            // order table id, order table 에 insert 전에 id 를 먼저 채번할 것
    val svcType: String = "C2",            // 고정값
    val pgInfos: Map<String, Map<String, Any>> = mapOf(),
    val items: List<Map<String, Any>> = listOf(),
    val totalAmount: String = "0"
//    val businessNo: String  해당 필드는 제외할 것
)

interface PgInfos {
    val svcPaySeq: String  // 결제수단 정보를 order table 에 넣을 거라면 order table id, Or 결제수단 정보가 들어가는 테이블 id
    val pgId: String
    val amount: Int
}

class OCredit(override val svcPaySeq: String, data: Map<String, Any>) : PgInfos {
    override val pgId: String by data    // /v1/orders/payments/method 의 pgId
    override val amount: Int by data
    val cardCompanyCode: String by data  // 빌링기준 카드코드
    val cardKey: String by data

    val installmentMonth: Int = 0
    val interestFreeType: String = "ALL" // 고정값
    val interestFree: Boolean = false    // 고정값
    val sellerBurden: Boolean = false    // 고정값
    val cardPointUsing: Boolean = false  // 고정값
    val cardAdBenefit: Boolean = false   // 고정값
//    val interestFreeInfo : Map<String, Map<String, String>>
}

class OBank(override val svcPaySeq: String, data: Map<String, Any>) : PgInfos {
    override val pgId: String by data
    override val amount: Int by data
    val bankCode: String by data
    val accountKey: String by data
}

class Item(newOrderId: String, data: Map<String, Any>) {
    val cpId: Int by data
    val itemId: Int by data
    val title: String by data
    val amount: Int by data

    val orderNo: String = newOrderId
    val orderProductType: String = "PD" // 고정값
    val sellerNo: String = "500000121"  // 고정값
    val taxationType: String = "TX"     // 고정값
    val evidence: Boolean = false       // 고정값
    val culture: Boolean = false        // 고정값
}


