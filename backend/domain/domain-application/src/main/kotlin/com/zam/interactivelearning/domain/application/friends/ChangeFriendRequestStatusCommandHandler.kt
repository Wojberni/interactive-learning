package com.zam.interactivelearning.domain.application.friends

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.domain.api.common.DomainException
import com.zam.interactivelearning.domain.api.friends.ChangeFriendRequestStatusCommand
import com.zam.interactivelearning.domain.api.friends.FriendRequestStatus
import com.zam.interactivelearning.domain.api.friends.FriendRequestStatusChangedEvent
import com.zam.interactivelearning.events.EventPublisher
import kotlin.reflect.KClass

class ChangeFriendRequestStatusCommandHandler(
    private val friendRequestRepository: FriendRequestRepository,
    private val eventPublisher: EventPublisher
): CommandHandler<ChangeFriendRequestStatusCommand, Unit> {

    override fun handle(command: ChangeFriendRequestStatusCommand) {
        val friendRequest = friendRequestRepository.findById(command.friendRequestId)
            .orElseThrow { DomainException("Friend request with id ${command.friendRequestId} not found") }

        if (friendRequest.status != FriendRequestStatus.PENDING)
            throw DomainException("Friend request with id ${command.friendRequestId} is not pending")

        friendRequest.status = command.status
        friendRequestRepository.save(friendRequest)

        eventPublisher.publish(FriendRequestStatusChangedEvent(
            friendRequest.senderId, friendRequest.receiverId, friendRequest.status
        ))
    }

    override fun supportedClass(): KClass<ChangeFriendRequestStatusCommand> {
        return ChangeFriendRequestStatusCommand::class
    }

}