package com.navercorp.ordertest.mapper

import com.navercorp.ordertest.dto.CpItemDto
import org.apache.ibatis.annotations.Mapper

@Mapper
interface CpItemMapper {

    fun createCpItem(cpItem : CpItemDto)
    fun getCpIdList(): List<CpItemDto>
    fun getItemIdList(cpId : Int): List<Int>
    fun deleteCpItem(cpItem : CpItemDto)
}