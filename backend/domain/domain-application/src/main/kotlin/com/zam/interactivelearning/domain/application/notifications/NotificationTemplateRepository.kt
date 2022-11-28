package com.zam.interactivelearning.domain.application.notifications

import org.springframework.data.repository.CrudRepository

interface NotificationTemplateRepository: CrudRepository<NotificationTemplateEntity, Long> {
    fun findByNotificationName(notificationName: String): NotificationTemplateEntity?
}