package com.zam.interactivelearning.domain.api.friends

import com.zam.interactivelearning.events.Event

class FriendRequestCreatedEvent(
    val senderId: Long,
    val targetId: Long,
): Event()