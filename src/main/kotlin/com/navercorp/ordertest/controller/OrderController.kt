package com.navercorp.ordertest.controller

import com.navercorp.ordertest.dto.PaymentsMethodRequest
import com.navercorp.ordertest.service.OrderService
import mu.NamedKLogging
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import org.springframework.web.servlet.support.ServletUriComponentsBuilder

@RestController
@RequestMapping("/api/proxy")
class OrderController @Autowired constructor(val orderService: OrderService) {
    companion object : NamedKLogging("TEXT_CONSOLE")

    @GetMapping("/accounts")
    fun getAccountInfo(@RequestParam userKey : String) : ResponseEntity<String> {
        logger.info("[OrderController] GET /api/proxy/accounts")
        return orderService.getAccountInfo(userKey)
    }

    @PostMapping("/cards")
    fun getCardInfo(@RequestBody requestParam: Map<String, String>) : ResponseEntity<String> {
        logger.info("[OrderController] POST /api/proxy/cards")
        return orderService.getCardInfo(requestParam)
    }

    @PostMapping("/payments/method")
    fun getPaymentsMethod(@RequestBody requestParam : PaymentsMethodRequest) : ResponseEntity<String> {
        logger.info("[OrderController] POST /api/proxy/payments/method")
        return orderService.getPaymentsMethod(requestParam)
    }

    @PostMapping("/payments")
    fun submitPayment(@RequestBody requestParam : Map<String, Any>) : ResponseEntity<String> {
        logger.info("[OrderController] POST /api/proxy/payments")
        return orderService.submitPayment(requestParam)
    }
}