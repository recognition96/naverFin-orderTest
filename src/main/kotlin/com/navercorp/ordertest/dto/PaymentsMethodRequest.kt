package com.navercorp.ordertest.dto

data class PaymentsMethodRequest(
    val chnl: String = "NV",
    val userId: String,
    val userKey: String,
    val device: String = "PC",
    val svcType: String = "C2",
    val pgTypes: List<String> = listOf("OCREDIT", "OBANK"),
    val items: List<Map<String, String>> = listOf(mutableMapOf("cpId" to "NMP", "itemId" to "NMP"))
)
