package com.zam.interactivelearning.application

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication()
class InteractiveLearningApplication

fun main(args: Array<String>) {
    runApplication<InteractiveLearningApplication>(*args)
}
