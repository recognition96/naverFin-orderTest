package com.navercorp.ordertest.dto

data class ItemToOrderDto(
    val id : Int,
    val name : String = "default name",
    val price : Int = 100000,
    val shippingCost : Int = 0,
    val imgURL : String = "/img/default-150x150.png",
    val optionId : Int = 0,
    val option1_value : String?,
    val option2_value : String?,
    val qty : Int,
    val cpId : String,
    val itemId : String,
)