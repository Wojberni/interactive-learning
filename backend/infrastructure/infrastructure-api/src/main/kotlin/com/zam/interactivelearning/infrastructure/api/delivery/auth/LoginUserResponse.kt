package com.zam.interactivelearning.infrastructure.api.delivery.auth

import javax.validation.constraints.NotNull

class LoginUserResponse(
    @get: NotNull
    val token: String,
) {
}