package com.zam.interactivelearning.domain.application.notifications

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.notifications.GetNotificationTargetQuery
import com.zam.interactivelearning.domain.api.notifications.NotificationTarget
import kotlin.reflect.KClass

class GetNotificationTargetQueryHandler(
    private val repository: NotificationTargetRepository
): QueryHandler<GetNotificationTargetQuery, NotificationTarget?> {

    override fun handle(query: GetNotificationTargetQuery): NotificationTarget? {
        val targetEntity = repository.findByUserId(query.targetId)

        return if (targetEntity == null) {
            null
        } else {
            NotificationTarget(targetEntity.targetFirebaseToken)
        }
    }

    override fun supportedClass(): KClass<GetNotificationTargetQuery> {
        return GetNotificationTargetQuery::class
    }

}