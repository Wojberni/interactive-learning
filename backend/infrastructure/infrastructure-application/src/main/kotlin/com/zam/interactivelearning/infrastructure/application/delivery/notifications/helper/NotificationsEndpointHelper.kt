package com.zam.interactivelearning.infrastructure.application.delivery.notifications.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.notifications.RegisterOrUpdateDeviceTokenCommand
import com.zam.interactivelearning.infrastructure.api.delivery.notifications.RegisterOrUpdateDeviceTokenRequest

class NotificationsEndpointHelper(
    private val executor: CqrsExecutor
) {

    fun registerOrUpdateDeviceToken(request: RegisterOrUpdateDeviceTokenRequest) {
        executor.executeCommand(RegisterOrUpdateDeviceTokenCommand(request.token))
    }
}