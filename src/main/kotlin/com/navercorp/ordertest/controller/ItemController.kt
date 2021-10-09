package com.navercorp.ordertest.controller

import com.navercorp.ordertest.dto.CpItemDto
import com.navercorp.ordertest.dto.ItemDto
import com.navercorp.ordertest.dto.ItemTableDto
import com.navercorp.ordertest.service.ItemService
import mu.NamedKLogging
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import org.springframework.web.servlet.support.ServletUriComponentsBuilder
import java.util.*
import kotlin.collections.HashMap

@RestController
@RequestMapping("/api")
class ItemController @Autowired constructor(val itemService: ItemService) {
    companion object : NamedKLogging("TEXT_CONSOLE")

    @PostMapping("/item")
    fun createItemForJson(@RequestBody item : ItemDto) : ResponseEntity<Boolean> {
        itemService.createItem(item)
        logger.info("[ItemController] POST /api/item")
        return ResponseEntity
            .ok()
            .body(true)
    }

    @GetMapping("/item/{id}")
    fun getItem(@PathVariable id : Int) : ResponseEntity<Any> {
        logger.info("[ItemController] GET /api/items/${id}")
        return ResponseEntity
            .ok()
            .body(itemService.getItem(id))
    }

    @GetMapping("/item-table")
    fun getItemTable(): List<ItemTableDto> {
        logger.info("[ItemController] GET /api/item-table")
        return itemService.getItemTable()
    }

    @PutMapping("/item/{id}")
    fun updateItem(@PathVariable id : Int, @RequestBody item : ItemDto) : ResponseEntity<Boolean> {
        println(item)
        itemService.updateItem(item)
        logger.info("[ItemController] PUT /api/items/${id}")
        return ResponseEntity
            .ok()
            .body(true)
    }

    @DeleteMapping("/item/{id}")
    fun deleteItem(@PathVariable id : Int) : ResponseEntity<Boolean> {
        itemService.deleteItem(id)
        logger.info("[ItemController] DELETE /api/items/${id}")
        return ResponseEntity
            .ok()
            .body(true)
    }


    @PostMapping("/cp-item")
    fun createCpItem(@RequestBody cpItem : CpItemDto) : ResponseEntity<Boolean> {
        itemService.createCpItem(cpItem)
        logger.info("[ItemController] POST /api/cp-item")
        return ResponseEntity
            .ok()
            .body(true)
    }

    @GetMapping("/cpid")
    fun getCpIdList() : ResponseEntity<List<Int>> {
        logger.info("[ItemController] GET /api/cpid")
        return ResponseEntity
            .ok()
            .body(itemService.getCpIdList())
    }

    @GetMapping("/cpid/{cpId}/itemid")
    fun getItemIdList(@PathVariable cpId : Int) : ResponseEntity<List<Int>> {
        logger.info("[ItemController] GET /api/cpid/${cpId}/itemid")
        return ResponseEntity
            .ok()
            .body(itemService.getItemIdList(cpId))
    }

    @DeleteMapping("/cpid/{cpId}", "/cpid/{cpId}/itemid/{itemId}")
    fun deleteCpItem(@ModelAttribute cpItem: CpItemDto) : ResponseEntity<Boolean> {
        val deleteResult = itemService.deleteCpItem(cpItem)
        logger.info("[ItemController] DELETE" + ServletUriComponentsBuilder.fromCurrentRequestUri().toUriString())
        return ResponseEntity
            .ok()
            .body(deleteResult)
    }
}