package com.navercorp.ordertest.controller

import com.navercorp.ordertest.dto.ItemToOrderDto
import mu.NamedKLogging
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.*
import org.springframework.web.servlet.ModelAndView

@Controller
class ViewController {
    companion object : NamedKLogging("TEXT_CONSOLE")

    @GetMapping("/")
    fun getIndex(): String {
        logger.info("[ViewController] GET /")
        return "item-list"
    }

    @GetMapping("/items")
    fun getItemList(): String {
        logger.info("[ViewController] GET /items")
        return "item-list"
    }

    @GetMapping("/item/add")
    fun getItemAddPage(): String {
        logger.info("[ViewController] GET /item/add")
        return "item-add"
    }

    @GetMapping("/item/edit")
    fun getItemEditPage(@RequestParam id: String): String {
        logger.info("[ViewController] GET /item/edit?id=${id}")
        return "item-edit"
    }

    @GetMapping("/item/detail")
    fun getItemDetailPage(@RequestParam id: String): String {
        logger.info("[ViewController] GET /item/detail?id=${id}")
        return "item-detail"
    }

    @PostMapping("/orderSheet")
    fun getOrderSheet(@ModelAttribute itemToOrderDto: ItemToOrderDto): ModelAndView {
        val orderSheet = ModelAndView("ordersheet")
        orderSheet.addObject("orderData", itemToOrderDto)
        logger.info("[ViewController] POST /item/detail")
        return orderSheet
    }

}
