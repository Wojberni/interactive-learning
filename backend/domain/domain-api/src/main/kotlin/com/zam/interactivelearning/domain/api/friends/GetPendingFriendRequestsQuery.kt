package com.zam.interactivelearning.domain.api.friends

import com.zam.interactivelearning.cqrs.Query

data class GetPendingFriendRequestsQuery(
    val userId: Long
): Query<List<FriendRequest>>