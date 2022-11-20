package com.zam.interactivelearning.domain.application.friends

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.friends.FriendRequest
import com.zam.interactivelearning.domain.api.friends.FriendRequestStatus
import com.zam.interactivelearning.domain.api.friends.GetPendingFriendRequestsQuery
import kotlin.reflect.KClass

class GetPendingFriendRequestsQueryHandler(
    private val repository: FriendRequestRepository
): QueryHandler<GetPendingFriendRequestsQuery, List<FriendRequest>> {

    override fun handle(query: GetPendingFriendRequestsQuery): List<FriendRequest> {
        val pendingRequests = repository.findAllByReceiverIdAndStatus(query.userId, FriendRequestStatus.PENDING)
        return pendingRequests.map {
            FriendRequest(
                it.id,
                it.receiverId,
                it.senderId,
                it.status
            )
        }

    }

    override fun supportedClass(): KClass<GetPendingFriendRequestsQuery> {
        return GetPendingFriendRequestsQuery::class
    }
}