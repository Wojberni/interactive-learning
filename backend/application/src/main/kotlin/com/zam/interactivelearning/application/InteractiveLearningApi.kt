package com.zam.interactivelearning.application

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication()
class InteractiveLearningApi

fun main(args: Array<String>) {
    runApplication<InteractiveLearningApi>(*args)
}
