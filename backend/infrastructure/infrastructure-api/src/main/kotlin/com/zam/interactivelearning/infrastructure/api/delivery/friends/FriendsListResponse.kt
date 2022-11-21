package com.zam.interactivelearning.infrastructure.api.delivery.friends

import javax.validation.constraints.NotNull

data class FriendsListResponse(
    @get: NotNull
    val friends: List<Friend>
)