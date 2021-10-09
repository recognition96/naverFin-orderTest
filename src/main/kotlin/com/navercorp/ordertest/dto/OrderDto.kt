package com.navercorp.ordertest.dto

import java.time.LocalDateTime

data class OrderDto(
    val id : Int,
    val userId : Int = 0,
    val addrId : Int = 1,
    val deliveryCost : Int = 0,
    val totalCost : Int,
    val orderDateTime: LocalDateTime,
    val status : String = "RDY"
)
