package com.zam.interactivelearning.domain.api.friends

import com.zam.interactivelearning.events.Event

class FriendRequestStatusChangedEvent(
    val userId: Long,
    val targetId: Long,
    val newStatus: FriendRequestStatus
): Event()