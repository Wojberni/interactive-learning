package com.zam.interactivelearning.infrastructure.api.notifications

interface NotificationSender {
    fun sendNotification(targetId: Long, title: String, content: String)
    fun sendGlobalNotification(title: String, content: String)
}