package com.zam.interactivelearning.events


import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.context.ApplicationListener

abstract class EventHandler<T: Event>(
    private val logger: Logger = LoggerFactory.getLogger(EventHandler::class.java)
): ApplicationListener<T> {

        abstract fun handle(event: T)

        override fun onApplicationEvent(event: T) {
            logger.debug("Handling event $event")
            handle(event)
        }

}