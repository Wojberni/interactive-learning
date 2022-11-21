package com.zam.interactivelearning.domain.application.friends

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.domain.api.common.DomainException
import com.zam.interactivelearning.domain.api.friends.RemoveFriendCommand
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import org.springframework.transaction.annotation.Transactional
import java.lang.IllegalStateException
import kotlin.reflect.KClass

@Transactional
class RemoveFriendCommandHandler(
    private val userRepository: UserRepository
): CommandHandler<RemoveFriendCommand, Unit> {

    override fun handle(command: RemoveFriendCommand) {
        val user = userRepository.findById(command.userId)
            .orElseThrow { IllegalStateException("User with id ${command.userId} does not exist") }

        val friend = user.friends
            .find { it.id == command.friendId }
            ?: throw DomainException("User with id ${command.userId} is not friends with user with id ${command.friendId}")

        user.friends.remove(friend)
        friend.friends.remove(user)
    }

    override fun supportedClass(): KClass<RemoveFriendCommand> {
        return RemoveFriendCommand::class
    }
}