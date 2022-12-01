package com.zam.interactivelearning.application

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.scheduling.annotation.EnableScheduling

@SpringBootApplication
@EnableScheduling
class InteractiveLearningApplication

fun main(args: Array<String>) {
    runApplication<InteractiveLearningApplication>(*args)
}
