package com.zam.interactivelearning.domain.api.friends

class FriendRequest(
    val id: Long,
    val targetId: Long,
    val senderId: Long,
    val status: FriendRequestStatus,
)