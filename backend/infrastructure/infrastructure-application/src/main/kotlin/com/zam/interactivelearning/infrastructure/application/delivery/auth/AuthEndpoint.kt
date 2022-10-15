package com.zam.interactivelearning.infrastructure.application.delivery.auth

import com.zam.interactivelearning.infrastructure.api.delivery.auth.LoginUserRequest
import com.zam.interactivelearning.infrastructure.api.delivery.auth.LoginUserResponse
import com.zam.interactivelearning.infrastructure.api.delivery.auth.RegisterUserRequest
import com.zam.interactivelearning.infrastructure.api.delivery.common.EmptyResponse
import com.zam.interactivelearning.infrastructure.application.delivery.auth.helper.AuthEndpointHelper
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*
import javax.validation.Valid

@RestController
@RequestMapping("/auth")
class AuthEndpoint(
    val authHelper: AuthEndpointHelper
) {

    @PostMapping("/register")
    @ResponseStatus(HttpStatus.CREATED)
    fun register(@RequestBody @Valid registerUserRequest: RegisterUserRequest): EmptyResponse {
        authHelper.registerUser(registerUserRequest)
        return EmptyResponse()
    }

    @PostMapping("/login")
    fun login(@RequestBody @Valid loginUserRequest: LoginUserRequest): LoginUserResponse {
        return authHelper.loginUser(loginUserRequest)
    }

    @GetMapping("/foobar")
    fun test(): EmptyResponse {
        authHelper.currentUser()
        return EmptyResponse()
    }
}