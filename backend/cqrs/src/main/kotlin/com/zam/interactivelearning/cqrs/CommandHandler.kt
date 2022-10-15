package com.zam.interactivelearning.cqrs

import kotlin.reflect.KClass

interface CommandHandler<CommandT: Command<ResultT>, ResultT> {
    fun handle(command: CommandT): ResultT
    fun supportedClass(): KClass<CommandT>
}