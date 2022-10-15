package com.zam.interactivelearning.domain.application.user

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.domain.api.user.PrintCurrentUserInfoCommand
import com.zam.interactivelearning.security.api.UserContextHolder
import kotlin.reflect.KClass

class PrintCurrentUserInfoCommandHandler(
    private val userContextHolder: UserContextHolder
): CommandHandler<PrintCurrentUserInfoCommand, Unit> {
    override fun handle(command: PrintCurrentUserInfoCommand) {
        println(userContextHolder.getCurrentUser().username)
    }

    override fun supportedClass(): KClass<PrintCurrentUserInfoCommand> {
        return PrintCurrentUserInfoCommand::class
    }

}