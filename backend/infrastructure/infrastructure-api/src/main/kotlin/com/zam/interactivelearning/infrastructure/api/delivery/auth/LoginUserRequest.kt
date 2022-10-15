package com.zam.interactivelearning.infrastructure.api.delivery.auth

import javax.validation.constraints.NotBlank

class LoginUserRequest(
    @get: NotBlank(message = "Username cannot be blank")
    val username: String,
    @get: NotBlank(message = "Password cannot be blank")
    val password: String,
) {
}