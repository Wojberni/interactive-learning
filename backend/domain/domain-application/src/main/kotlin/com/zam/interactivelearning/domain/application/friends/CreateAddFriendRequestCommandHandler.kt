package com.zam.interactivelearning.domain.application.friends

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.friends.CreateAddFriendRequestCommand
import com.zam.interactivelearning.domain.api.friends.FriendRequestCreatedEvent
import com.zam.interactivelearning.domain.api.friends.FriendRequestPendingException
import com.zam.interactivelearning.domain.api.friends.FriendRequestStatus
import com.zam.interactivelearning.domain.api.user.GetUserByUsernameQuery
import com.zam.interactivelearning.events.EventPublisher
import com.zam.interactivelearning.security.api.UserContextHolder
import kotlin.reflect.KClass

class CreateAddFriendRequestCommandHandler(
    private val executor: CqrsExecutor,
    private val eventPublisher: EventPublisher,
    private val friendRequestRepository: FriendRequestRepository,
    private val contextHolder: UserContextHolder
): CommandHandler<CreateAddFriendRequestCommand, Unit> {
    override fun handle(command: CreateAddFriendRequestCommand) {
        val targetUser = executor.executeQuery(GetUserByUsernameQuery(command.targetUsername))
        val senderUser = contextHolder.getCurrentUser()

        validatePendingRequestExistence(senderUser.id, targetUser.id)
        validatePendingRequestExistence(targetUser.id, senderUser.id)

        friendRequestRepository.save(
            FriendRequestEntity(
                senderId = senderUser.id,
                receiverId = targetUser.id,
                status = FriendRequestStatus.PENDING
            )
        )

        eventPublisher.publish(FriendRequestCreatedEvent(senderUser.id, targetUser.id))
    }

    override fun supportedClass(): KClass<CreateAddFriendRequestCommand> {
        return CreateAddFriendRequestCommand::class
    }

    private fun validatePendingRequestExistence(senderId: Long, targetId: Long) {
        friendRequestRepository.findBySenderIdAndReceiverId(senderId, targetId)
            .map { it.status }
            .map {
                if (it == FriendRequestStatus.PENDING) {
                    throw FriendRequestPendingException("Friend request already pending")
                }
            }
    }

}