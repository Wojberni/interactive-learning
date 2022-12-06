package com.zam.interactivelearning.infrastructure.api.delivery.friends

import javax.validation.constraints.NotNull

data class Friend(
    @get: NotNull
    val id: Long,
    @get: NotNull
    val username: String,
    @get: NotNull
    val score: Int,
    @get: NotNull
    val dailyStreak: Int,
)