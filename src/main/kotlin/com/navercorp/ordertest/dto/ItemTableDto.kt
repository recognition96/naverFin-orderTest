package com.navercorp.ordertest.dto

import java.sql.Date
import java.time.LocalDate

data class ItemTableDto (

    val id : Int?,
    val name : String = "default name",
    val price : Int = 100000,
    val category : String = "default category",
    val imgURL : String = "../img/default-150x150.png",
    val regDate : Date? = Date.valueOf(LocalDate.now())
) {
    object ModelMapper {
        fun from(itemDto: ItemDto) =
            ItemTableDto(itemDto.id, itemDto.name, itemDto.price, itemDto.category, itemDto.imgURL, itemDto.regDate)
    }
}