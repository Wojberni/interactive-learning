package com.zam.interactivelearning.infrastructure.api.delivery.friends

import javax.validation.constraints.NotNull

data class FriendRequest(
    @get: NotNull
    val id: Long,
    @get: NotNull
    val senderUsername: String,
)