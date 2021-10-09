package com.navercorp.ordertest

import mu.KotlinLogging
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

private val logger = KotlinLogging.logger {}

@SpringBootApplication
class OrdertestApplication {
}

fun main(args: Array<String>) {
    runApplication<OrdertestApplication>(*args)

}
