package com.navercorp.ordertest.mapper

import com.navercorp.ordertest.dto.ItemDto
import org.apache.ibatis.annotations.Mapper

@Mapper
interface ItemMapper {

    fun createItem(item : ItemDto)
    fun getItem(id : Int) : ItemDto
    fun getItemList() : List<ItemDto>
    fun updateItem(item: ItemDto)
    fun deleteItem(id : Int)
}