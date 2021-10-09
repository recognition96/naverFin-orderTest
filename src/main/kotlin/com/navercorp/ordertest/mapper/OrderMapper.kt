package com.navercorp.ordertest.mapper

import com.navercorp.ordertest.dto.OrderDetailDto
import com.navercorp.ordertest.dto.OrderDto
import com.navercorp.ordertest.dto.PaymentDetailDto
import org.apache.ibatis.annotations.Mapper

@Mapper
interface OrderMapper {

    fun selectOrderKey() : String
    fun selectPaymentKey() : String
    fun createOrder(order : OrderDto)
    fun createOrderDetail(orderDetail : OrderDetailDto)
    fun createPaymentDetail(paymentsDetailDto: PaymentDetailDto)
}