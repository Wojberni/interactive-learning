package com.zam.interactivelearning.domain.application.friends

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.friends.FriendRequestCreatedEvent
import com.zam.interactivelearning.domain.api.notifications.Notifications
import com.zam.interactivelearning.domain.api.notifications.SendNotificationEvent
import com.zam.interactivelearning.domain.api.user.GetUsernameByIdQuery
import com.zam.interactivelearning.domain.application.notifications.NotificationTemplateRepository
import com.zam.interactivelearning.events.EventHandler
import com.zam.interactivelearning.events.EventPublisher

class SendFriendRequestNotificationEventHandler(
    private val notificationTemplateRepository: NotificationTemplateRepository,
    private val executor: CqrsExecutor,
    private val eventPublisher: EventPublisher
): EventHandler<FriendRequestCreatedEvent>() {

    override fun handle(event: FriendRequestCreatedEvent) {
        val template = notificationTemplateRepository
            .findByNotificationName(Notifications.INCOMING_FRIEND_REQUEST.notificationName)
            ?: throw IllegalStateException("Notification template not found for notification name: ${Notifications.INCOMING_FRIEND_REQUEST.notificationName}")

        val senderUsername = executor.executeQuery(GetUsernameByIdQuery(event.senderId))
        val notificationContent = String.format(template.notificationTemplate, senderUsername)

        eventPublisher.publish(SendNotificationEvent(event.targetId, template.notificationTitle, notificationContent))
    }

}