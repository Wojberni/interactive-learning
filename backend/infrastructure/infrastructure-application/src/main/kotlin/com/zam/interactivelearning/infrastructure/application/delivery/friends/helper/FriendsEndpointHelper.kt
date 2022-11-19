package com.zam.interactivelearning.infrastructure.application.delivery.friends.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.friends.CreateAddFriendRequestCommand
import com.zam.interactivelearning.infrastructure.api.delivery.friends.AddFriendRequest

class FriendsEndpointHelper(
    private val executor: CqrsExecutor
) {

    fun addFriend(request: AddFriendRequest) {
        executor.executeCommand(CreateAddFriendRequestCommand(request.username))
    }
}