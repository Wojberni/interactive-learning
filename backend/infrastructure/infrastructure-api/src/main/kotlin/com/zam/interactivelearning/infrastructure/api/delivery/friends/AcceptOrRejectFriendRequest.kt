package com.zam.interactivelearning.infrastructure.api.delivery.friends

enum class AcceptOrRejectFriendRequestAction {
    ACCEPT,
    REJECT
}
data class AcceptOrRejectFriendRequest(
    val friendRequestId: Long,
    val action: AcceptOrRejectFriendRequestAction
)