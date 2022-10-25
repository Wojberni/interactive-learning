package com.zam.interactivelearning.infrastructure.api.delivery.auth

import javax.validation.constraints.Email
import javax.validation.constraints.NotBlank
import javax.validation.constraints.Size

class RegisterUserRequest(
    @get: NotBlank(message = "Email cannot be blank")
    @get: Email(message = "Email must be a valid email address")
    @get: Size(max = 100, message = "Email must not be longer than 100 characters")
    val email: String,
    @get: NotBlank(message = "Username cannot be blank")
    @get: Size(max = 100, message = "Username must not be longer than 100 characters")
    val username: String,
    @get: NotBlank(message = "Password cannot be blank")
    @get: Size(max = 100, message = "Password must not be longer than 100 characters")
    val password: String
)