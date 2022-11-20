package com.zam.interactivelearning.infrastructure.application.delivery.friends.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.friends.CreateAddFriendRequestCommand
import com.zam.interactivelearning.domain.api.friends.GetPendingFriendRequestsQuery
import com.zam.interactivelearning.domain.api.user.GetUsernameByIdQuery
import com.zam.interactivelearning.infrastructure.api.delivery.friends.AddFriendRequest
import com.zam.interactivelearning.infrastructure.api.delivery.friends.FriendRequest
import com.zam.interactivelearning.infrastructure.api.delivery.friends.PendingFriendRequestsResponse
import com.zam.interactivelearning.security.api.UserContextHolder

class FriendsEndpointHelper(
    private val executor: CqrsExecutor,
    private val contextHolder: UserContextHolder
) {

    fun addFriend(request: AddFriendRequest) {
        executor.executeCommand(CreateAddFriendRequestCommand(request.username))
    }

    fun getPendingFriendRequests(): PendingFriendRequestsResponse {
        val pendingRequests = executor.executeQuery(GetPendingFriendRequestsQuery(contextHolder.getCurrentUser().id))
        return PendingFriendRequestsResponse(
            pendingRequests.map {
                FriendRequest(
                    id = it.id,
                    senderUsername = executor.executeQuery(GetUsernameByIdQuery(it.senderId))
                )
            }
        )
    }


}