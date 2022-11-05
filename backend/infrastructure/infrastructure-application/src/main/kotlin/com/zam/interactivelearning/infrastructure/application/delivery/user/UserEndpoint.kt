package com.zam.interactivelearning.infrastructure.application.delivery.user

import com.zam.interactivelearning.infrastructure.api.delivery.user.UserProfileResponse
import com.zam.interactivelearning.infrastructure.application.delivery.user.helper.UserEndpointHelper
import io.swagger.v3.oas.annotations.Operation
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/users")
class UserEndpoint(
    val helper: UserEndpointHelper
) {

    @GetMapping("/profile/me")
    @Operation(summary = "Get the current user's profile")
    fun getCurrentUserProfile(): UserProfileResponse {
        return helper.getCurrentUserProfile()
    }
}