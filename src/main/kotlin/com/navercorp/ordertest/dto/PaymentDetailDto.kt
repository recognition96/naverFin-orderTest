package com.navercorp.ordertest.dto

import java.time.LocalDateTime

class PaymentDetailDto (
    pgInfos: Map<String, Any>,
    evidenceInfos: Map<String, Any>,
    val orderId: Int,
    val pkgSeq: String,  // 빌링 묶음주문번호
    val paymentDateTime: LocalDateTime
) {
    @delegate:Transient
    val pgId: String by pgInfos
    @delegate:Transient
    val paySeq: String by pgInfos
    @delegate:Transient
    val pgApprovalNo: String by pgInfos

    @delegate:Transient
    val receiptType: String by evidenceInfos
    @delegate:Transient
    val totalAmount: Int by evidenceInfos  // 총금액
    @delegate:Transient
    val supplyAmount: Int by evidenceInfos
    @delegate:Transient
    val taxAmount: Int by evidenceInfos
    @delegate:Transient
    val orderNo: String by evidenceInfos
    @delegate:Transient
    val receiptSeq: String by evidenceInfos
    @delegate:Transient
    val tradeType: String by evidenceInfos

    val id: Int = 0
}