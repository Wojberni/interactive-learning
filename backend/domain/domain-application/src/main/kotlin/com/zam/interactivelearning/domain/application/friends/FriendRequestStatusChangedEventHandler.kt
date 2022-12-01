package com.zam.interactivelearning.domain.application.friends

import com.zam.interactivelearning.domain.api.friends.FriendRequestStatus
import com.zam.interactivelearning.domain.api.friends.FriendRequestStatusChangedEvent
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import com.zam.interactivelearning.events.EventHandler
import org.springframework.transaction.annotation.Transactional

@Transactional
class FriendRequestStatusChangedEventHandler(
    private val userRepository: UserRepository
): EventHandler<FriendRequestStatusChangedEvent>() {

    override fun handle(event: FriendRequestStatusChangedEvent) {
        if (event.newStatus != FriendRequestStatus.ACCEPTED) {
            return
        }

        val user = userRepository.findById(event.userId).get()
        val friend = userRepository.findById(event.targetId).get()

        if (user.friends.contains(friend) || friend.friends.contains(user)) {
            throw IllegalStateException("Users ${user.id} and ${friend.id}  are already friends")
        }

        user.friends.add(friend)
        friend.friends.add(user)

        userRepository.saveAll(listOf(user, friend))
    }
}