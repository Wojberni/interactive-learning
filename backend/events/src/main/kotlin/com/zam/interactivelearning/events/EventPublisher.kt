package com.zam.interactivelearning.events


import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.context.ApplicationEventPublisher

class EventPublisher(
    private val applicationEventPublisher: ApplicationEventPublisher,
    private val logger: Logger = LoggerFactory.getLogger(EventPublisher::class.java)
) {

    fun publish(event: Event) {
        logger.debug("Publishing event $event")
        applicationEventPublisher.publishEvent(event)
    }

}