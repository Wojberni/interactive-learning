package com.zam.interactivelearning.infrastructure.api.delivery.user

import javax.validation.constraints.NotNull

class UserProfileResponse(
    @get: NotNull
    val username: String,
    @get: NotNull
    val email: String,
    @get: NotNull
    val finishedActivitiesCount: Int,
    @get: NotNull
    val friendsCount: Int,
)