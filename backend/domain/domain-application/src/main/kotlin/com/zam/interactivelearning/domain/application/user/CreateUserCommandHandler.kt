package com.zam.interactivelearning.domain.application.user

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.domain.api.user.CreateUserCommand
import com.zam.interactivelearning.domain.api.user.UserExistsException
import kotlin.reflect.KClass

class CreateUserCommandHandler(
    private val userRepository: UserRepository,
): CommandHandler<CreateUserCommand, Unit> {

    override fun handle(command: CreateUserCommand) {
        if (userRepository.existsByUsername(command.username)) {
            throw UserExistsException("User with username ${command.username} already exists")
        }

        val user = UserEntity(
            email = command.email,
            username = command.username,
            password = command.password
        )

        userRepository.save(user)
    }

    override fun supportedClass(): KClass<CreateUserCommand> {
        return CreateUserCommand::class
    }
}