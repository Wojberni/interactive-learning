package com.zam.interactivelearning.infrastructure.application.notifications

import com.google.firebase.messaging.AndroidConfig
import com.google.firebase.messaging.FirebaseMessaging
import com.google.firebase.messaging.Message
import com.google.firebase.messaging.Notification
import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.notifications.GetNotificationTargetQuery
import com.zam.interactivelearning.infrastructure.api.notifications.NotificationSender
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.context.annotation.Profile

class FirebaseNotificationSender(
    private val executor: CqrsExecutor,
    private val logger: Logger = LoggerFactory.getLogger(FirebaseNotificationSender::class.java)
): NotificationSender {

    override fun sendNotification(targetId: Long, title: String, content: String) {
        val target = executor.executeQuery(GetNotificationTargetQuery(targetId))
        if (target == null) {
            logger.info("No target found for id $targetId")
            return
        }

        val notification = Message.builder()
            .setNotification(
                Notification.builder()
                    .setTitle(title)
                    .setBody(content)
                    .build()
            )
            .setAndroidConfig(
                AndroidConfig.builder()
                .setPriority(AndroidConfig.Priority.HIGH)
                .build()
            )
            .setToken(target.token)
            .build()

        logger.info("Sending notification to $targetId")
        val response = FirebaseMessaging.getInstance().send(notification)
        logger.info("Notification sent to $targetId with response $response")
    }
}