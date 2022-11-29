package com.zam.interactivelearning.domain.application.notifications

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.notifications.GetAllNotificationTargetsQuery
import com.zam.interactivelearning.domain.api.notifications.NotificationTarget
import kotlin.reflect.KClass

class GetAllNotificationTargetsQueryHandler(
    private val notificationTargetRepository: NotificationTargetRepository
) : QueryHandler<GetAllNotificationTargetsQuery, List<NotificationTarget>> {

    override fun handle(query: GetAllNotificationTargetsQuery): List<NotificationTarget> {
        return notificationTargetRepository.findAll()
            .map {
                NotificationTarget(
                    it.targetFirebaseToken
                )
            }
    }

    override fun supportedClass(): KClass<GetAllNotificationTargetsQuery> {
        return GetAllNotificationTargetsQuery::class
    }

}