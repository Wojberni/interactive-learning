package com.zam.interactivelearning.infrastructure.application.notifications

import com.zam.interactivelearning.domain.api.notifications.SendGlobalNotificationEvent
import com.zam.interactivelearning.domain.api.notifications.SendNotificationEvent
import com.zam.interactivelearning.events.EventHandler
import com.zam.interactivelearning.infrastructure.api.notifications.NotificationSender

class SendGlobalNotificationEventHandler(
    private val notificationSender: NotificationSender
): EventHandler<SendGlobalNotificationEvent>() {

    override fun handle(event: SendGlobalNotificationEvent) {
        notificationSender.sendGlobalNotification(event.title, event.content)
    }
}