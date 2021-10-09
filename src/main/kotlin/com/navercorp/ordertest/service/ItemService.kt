package com.navercorp.ordertest.service

import com.navercorp.ordertest.dto.CpItemDto
import com.navercorp.ordertest.dto.ItemDto
import com.navercorp.ordertest.dto.ItemTableDto

interface ItemService {

    fun createItem(item : ItemDto)
    fun getItem(id : Int): ItemDto
    fun getItemTable(): List<ItemTableDto>
    fun updateItem(item : ItemDto)
    fun deleteItem(id : Int)

    fun createCpItem(cpItem : CpItemDto)
    fun getCpIdList(): List<Int>
    fun getItemIdList(cpId : Int): List<Int>
    fun deleteCpItem(cpItem : CpItemDto): Boolean
}