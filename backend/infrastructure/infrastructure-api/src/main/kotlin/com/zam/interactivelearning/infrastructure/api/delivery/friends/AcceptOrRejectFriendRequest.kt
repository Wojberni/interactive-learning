package com.zam.interactivelearning.infrastructure.api.delivery.friends

import javax.validation.constraints.NotNull

enum class AcceptOrRejectFriendRequestAction {
    ACCEPT,
    REJECT
}
data class AcceptOrRejectFriendRequest(
    @get: NotNull(message = "friendRequestId must be provided")
    val friendRequestId: Long,
    @get: NotNull(message = "action must be provided")
    val action: AcceptOrRejectFriendRequestAction
)