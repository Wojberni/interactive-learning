package com.zam.interactivelearning.domain.api.notifications

import com.zam.interactivelearning.cqrs.Command

data class RegisterOrUpdateDeviceTokenCommand(
    val token: String,
): Command<Unit>