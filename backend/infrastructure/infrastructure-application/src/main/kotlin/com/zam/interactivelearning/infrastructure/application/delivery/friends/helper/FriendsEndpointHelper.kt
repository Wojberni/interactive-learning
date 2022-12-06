package com.zam.interactivelearning.infrastructure.application.delivery.friends.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.friends.*
import com.zam.interactivelearning.domain.api.user.GetFriendsQuery
import com.zam.interactivelearning.domain.api.user.GetUsernameByIdQuery
import com.zam.interactivelearning.infrastructure.api.delivery.friends.*
import com.zam.interactivelearning.infrastructure.api.delivery.friends.Friend
import com.zam.interactivelearning.infrastructure.api.delivery.friends.FriendRequest
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

    fun getMyFriends(): FriendsListResponse {
        val friends = executor.executeQuery(GetFriendsQuery(contextHolder.getCurrentUser().id))
        return FriendsListResponse(
            friends.map {
                Friend(
                    it.id,
                    it.username,
                    it.score,
                    it.dailyStreak
                )
            }
        )
    }

    private fun getStatus(action: AcceptOrRejectFriendRequestAction): FriendRequestStatus {
        return when (action) {
            AcceptOrRejectFriendRequestAction.ACCEPT -> FriendRequestStatus.ACCEPTED
            AcceptOrRejectFriendRequestAction.REJECT -> FriendRequestStatus.REJECTED
        }
    }

    fun removeFriend(friendId: Long) {
        executor.executeCommand(RemoveFriendCommand(contextHolder.getCurrentUser().id, friendId))
    }


}