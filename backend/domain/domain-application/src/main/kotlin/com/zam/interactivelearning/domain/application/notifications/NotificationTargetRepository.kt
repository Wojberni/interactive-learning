package com.zam.interactivelearning.domain.application.notifications

import org.springframework.data.repository.CrudRepository

interface NotificationTargetRepository: CrudRepository<NotificationTargetEntity, Long> {
    fun findByUserId(userId: Long): NotificationTargetEntity?
}