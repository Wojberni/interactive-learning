package com.zam.interactivelearning.infrastructure.application.notifications

import com.zam.interactivelearning.domain.api.notifications.SendNotificationEvent
import com.zam.interactivelearning.events.EventHandler
import com.zam.interactivelearning.infrastructure.api.notifications.NotificationSender

class SendNotificationEventHandler(
    private val notificationSender: NotificationSender
): EventHandler<SendNotificationEvent>() {
    
    override fun handle(event: SendNotificationEvent) {
        notificationSender.sendNotification(event.targetId, event.title, event.content)
    }

}