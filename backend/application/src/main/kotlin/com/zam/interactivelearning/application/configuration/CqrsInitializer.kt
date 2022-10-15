package com.zam.interactivelearning.application.configuration

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.cqrs.QueryHandler
import org.slf4j.LoggerFactory
import org.springframework.context.ApplicationListener
import org.springframework.context.event.ContextRefreshedEvent

class CqrsInitializer(
    private val cqrsExecutor: CqrsExecutor,
    private val commandHandlers: List<CommandHandler<*, *>>,
    private val queryHandlers: List<QueryHandler<*, *>>
): ApplicationListener<ContextRefreshedEvent> {

    override fun onApplicationEvent(event: ContextRefreshedEvent) {
        val logger = LoggerFactory.getLogger(CqrsInitializer::class.java)

        logger.info("Found ${commandHandlers.size} command handlers")
        commandHandlers.forEach { handler ->
            logger.debug("Registering command handler for command ${handler.supportedClass().simpleName}")
            cqrsExecutor.registerCommandHandler(handler)
        }

        logger.info("Found ${queryHandlers.size} query handlers")
        queryHandlers.forEach { handler ->
            logger.debug("Registering query handler for query ${handler.supportedClass().simpleName}")
            cqrsExecutor.registerQueryHandler(handler)
        }
    }
}