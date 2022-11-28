package com.zam.interactivelearning.domain.api.notifications

import com.zam.interactivelearning.events.Event

data class SendNotificationEvent(
    val targetId: Long,
    val title: String,
    val content: String,
): Event()