package com.zam.interactivelearning.domain.application.friends

import com.zam.interactivelearning.domain.api.friends.FriendRequestStatus
import com.zam.interactivelearning.domain.api.friends.FriendRequestStatusChangedEvent
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import com.zam.interactivelearning.events.EventHandler

class FriendRequestStatusChangedEventHandler(
    private val userRepository: UserRepository
): EventHandler<FriendRequestStatusChangedEvent>() {

    override fun handle(event: FriendRequestStatusChangedEvent) {

        val user = userRepository.findById(event.userId).get()
        val friend = userRepository.findById(event.targetId).get()

        if (event.newStatus == FriendRequestStatus.ACCEPTED) {
            user.friends = user.friends.plus(friend)
            friend.friends = friend.friends.plus(user)
        } else if (event.newStatus == FriendRequestStatus.REJECTED) {
            user.friends = user.friends.minus(friend)
            friend.friends = friend.friends.minus(user)
        }

        userRepository.save(user)
        userRepository.save(friend)
    }
}