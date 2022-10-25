package com.zam.interactivelearning.infrastructure.application.delivery.auth.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.user.CreateUserCommand
import com.zam.interactivelearning.infrastructure.api.delivery.auth.LoginUserRequest
import com.zam.interactivelearning.infrastructure.api.delivery.auth.LoginUserResponse
import com.zam.interactivelearning.infrastructure.api.delivery.auth.RegisterUserRequest
import com.zam.interactivelearning.security.api.LoginUserCommand
import org.springframework.security.crypto.password.PasswordEncoder

class AuthEndpointHelper(
    private val executor: CqrsExecutor,
    private val passwordEncoder: PasswordEncoder
    ) {

    fun registerUser(registerUserRequest: RegisterUserRequest) {
        val command = CreateUserCommand(
            registerUserRequest.email,
            registerUserRequest.username,
            passwordEncoder.encode(registerUserRequest.password))
        executor.executeCommand(command)
    }

    fun loginUser(loginUserRequest: LoginUserRequest): LoginUserResponse {
        val token = executor.executeCommand(LoginUserCommand(loginUserRequest.username, loginUserRequest.password))
        return LoginUserResponse(token)
    }
}