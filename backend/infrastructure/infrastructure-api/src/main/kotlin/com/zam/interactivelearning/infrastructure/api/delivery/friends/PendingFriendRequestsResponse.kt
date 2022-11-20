package com.zam.interactivelearning.infrastructure.api.delivery.friends

import javax.validation.constraints.NotNull

data class PendingFriendRequestsResponse(
    @get: NotNull
    val friendRequests: List<FriendRequest>
)