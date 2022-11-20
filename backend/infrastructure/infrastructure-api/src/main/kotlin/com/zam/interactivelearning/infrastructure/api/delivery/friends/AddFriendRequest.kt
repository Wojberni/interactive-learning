package com.zam.interactivelearning.infrastructure.api.delivery.friends

import javax.validation.constraints.NotBlank

data class AddFriendRequest(
    @get: NotBlank(message = "Username cannot be blank")
    val username: String
)