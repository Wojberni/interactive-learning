package com.zam.interactivelearning.domain.api.notifications

import com.zam.interactivelearning.cqrs.Query

data class GetNotificationTargetQuery(
    val targetId: Long,
): Query<NotificationTarget?>