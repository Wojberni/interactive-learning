package com.zam.interactivelearning.cqrs

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import kotlin.reflect.KClass

class CqrsExecutor(
    private val queryHandlers: MutableMap<KClass<out Query<*>>, QueryHandler<Query<*>, *>> = mutableMapOf(),
    private val commandHandlers: MutableMap<KClass<out Command<*>>, CommandHandler<Command<*>, *>> = mutableMapOf(),
    private val logger: Logger = LoggerFactory.getLogger(CqrsExecutor::class.java)
) {

    fun registerQueryHandler(queryHandler: QueryHandler<out Query<*>, *>) {
        queryHandlers[queryHandler.supportedClass()] = queryHandler as QueryHandler<Query<*>, *>
    }

    fun registerCommandHandler(commandHandler: CommandHandler<out Command<*>, *>) {
        commandHandlers[commandHandler.supportedClass()] = commandHandler as CommandHandler<Command<*>, *>
    }

    fun <ResultT> executeQuery(query: Query<ResultT>): ResultT {
        logger.debug("Executing query $query")

        val queryHandler = queryHandlers[query::class] as QueryHandler<Query<ResultT>, ResultT>?
            ?: throw HandlerNotFoundException("No handler found for query: ${query::class}")
        return queryHandler.handle(query)
    }

    fun <ResultT> executeCommand(command: Command<ResultT>): ResultT {
        logger.debug("Executing command $command")

        val commandHandler = commandHandlers[command::class] as CommandHandler<Command<ResultT>, ResultT>?
            ?: throw HandlerNotFoundException("No handler found for command: ${command::class}")
        return commandHandler.handle(command)
    }
}