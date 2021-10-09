package com.navercorp.ordertest.dto

import java.sql.Date

data class ItemDto (

    val id : Int?,
    val name : String = "default name",
    val price : Int = 0,
    val category : String = "default category",
    val cpId : String = "50000195",
    val itemId : String = "50000392",
    val optionId : Int = 0,
    val imgURL : String = "../img/default-150x150.png",
    val shortDesc : String = "default short description",
    val longDesc : String = "default long description",
    val regDate : Date = Date(System.currentTimeMillis()),
    val is_show : String = "Y"
)