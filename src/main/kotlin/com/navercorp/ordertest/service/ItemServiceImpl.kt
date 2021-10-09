package com.navercorp.ordertest.service

import com.navercorp.ordertest.dto.CpItemDto
import com.navercorp.ordertest.dto.ItemDto
import com.navercorp.ordertest.dto.ItemTableDto
import com.navercorp.ordertest.mapper.CpItemMapper
import com.navercorp.ordertest.mapper.ItemMapper
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.stereotype.Service

@Service
class ItemServiceImpl @Autowired constructor(
    val itemMapper: ItemMapper,
    val cpItemMapper: CpItemMapper
) : ItemService {

    override fun createItem(item: ItemDto) {
        itemMapper.createItem(item)
    }

    override fun getItemTable(): List<ItemTableDto> {
        val itemList = itemMapper.getItemList()
        val itemTable = mutableListOf<ItemTableDto>()
        for (item in itemList) {
            val itemTabled = ItemTableDto.ModelMapper.from(item)
            itemTable.add(itemTabled)
        }
        return itemTable
    }

    override fun getItem(id: Int): ItemDto {
        return itemMapper.getItem(id)
    }

    override fun updateItem(item: ItemDto) {
        itemMapper.updateItem(item)
    }

    override fun deleteItem(id: Int) {
        itemMapper.deleteItem(id)
    }

    override fun createCpItem(cpItem: CpItemDto) {
        cpItemMapper.createCpItem(cpItem)
    }

    override fun getCpIdList(): List<Int> {
        return cpItemMapper.getCpIdList().map{ it.cpId }
    }

    override fun getItemIdList(cpId: Int): List<Int> {
        return cpItemMapper.getItemIdList(cpId)
    }

    override fun deleteCpItem(cpItem: CpItemDto): Boolean {
        return try {
            cpItemMapper.deleteCpItem(cpItem)
            true
        } catch (e: DataIntegrityViolationException) {
            false
        }
    }
}
