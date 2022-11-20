package com.zam.interactivelearning.domain.api.friends

import com.zam.interactivelearning.cqrs.Command

data class ChangeFriendRequestStatusCommand(
    val friendRequestId: Long,
    val status: FriendRequestStatus
): Command<Unit>