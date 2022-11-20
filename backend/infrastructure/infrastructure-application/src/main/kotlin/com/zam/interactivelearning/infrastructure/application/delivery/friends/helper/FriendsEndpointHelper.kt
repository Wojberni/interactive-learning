package com.zam.interactivelearning.infrastructure.application.delivery.friends.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.friends.ChangeFriendRequestStatusCommand
import com.zam.interactivelearning.domain.api.friends.CreateAddFriendRequestCommand
import com.zam.interactivelearning.domain.api.friends.FriendRequestStatus
import com.zam.interactivelearning.domain.api.friends.GetPendingFriendRequestsQuery
import com.zam.interactivelearning.domain.api.user.GetUsernameByIdQuery
import com.zam.interactivelearning.infrastructure.api.delivery.friends.*
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

    fun acceptOrRejectFriendRequest(request: AcceptOrRejectFriendRequest) {
        executor.executeCommand(ChangeFriendRequestStatusCommand(request.friendRequestId, getStatus(request.action)))
    }

    private fun getStatus(action: AcceptOrRejectFriendRequestAction): FriendRequestStatus {
        return when (action) {
            AcceptOrRejectFriendRequestAction.ACCEPT -> FriendRequestStatus.ACCEPTED
            AcceptOrRejectFriendRequestAction.REJECT -> FriendRequestStatus.REJECTED
        }
    }


}