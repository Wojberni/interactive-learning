package com.zam.interactivelearning.infrastructure.application.delivery.notifications

import com.zam.interactivelearning.infrastructure.api.delivery.notifications.RegisterOrUpdateDeviceTokenRequest
import com.zam.interactivelearning.infrastructure.application.delivery.notifications.helper.NotificationsEndpointHelper
import io.swagger.v3.oas.annotations.Operation
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController
import javax.validation.Valid

@RestController
class NotificationsEndpoint(
    val notificationsEndpointHelper: NotificationsEndpointHelper
) {

    @PostMapping("/notifications/device-token")
    @Operation(summary = "Registers or updates a firebase token associated with a device")
    fun registerOrUpdateDeviceToken(@RequestBody @Valid request: RegisterOrUpdateDeviceTokenRequest) {
        notificationsEndpointHelper.registerOrUpdateDeviceToken(request)
    }

}