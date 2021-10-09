package com.navercorp.ordertest.dto

data class OrderDetailDto(
    val id : Int = 0,
    val orderId : Int,
    val itemId : Int,
    val option1_value : String,
    val option2_value : String,
    val quantity : String,
    val status : String = "RDY"
)
