package com.zam.interactivelearning.infrastructure.api.delivery.notifications

import javax.validation.constraints.NotBlank

class RegisterOrUpdateDeviceTokenRequest(
    @get: NotBlank(message = "Device token is required")
    val token: String,
)