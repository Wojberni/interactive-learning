package com.zam.interactivelearning.domain.application.dailychallenge

import com.zam.interactivelearning.domain.api.dailychallenge.DailyChallengeChangedEvent
import com.zam.interactivelearning.domain.api.notifications.Notifications
import com.zam.interactivelearning.domain.api.notifications.SendGlobalNotificationEvent
import com.zam.interactivelearning.domain.application.notifications.NotificationTemplateRepository
import com.zam.interactivelearning.events.EventHandler
import com.zam.interactivelearning.events.EventPublisher

class SendDailyChallengeNotificationEventHandler(
    private val notificationTemplateRepository: NotificationTemplateRepository,
    private val eventPublisher: EventPublisher,
): EventHandler<DailyChallengeChangedEvent>() {

    override fun handle(event: DailyChallengeChangedEvent) {
        val template = notificationTemplateRepository
            .findByNotificationName(Notifications.NEW_DAILY_CHALLENGE.notificationName)
            ?: throw IllegalStateException("Notification template not found for notification name: ${Notifications.NEW_DAILY_CHALLENGE.notificationName}")

        eventPublisher.publish(SendGlobalNotificationEvent(template.notificationTitle, template.notificationTemplate))
    }

}