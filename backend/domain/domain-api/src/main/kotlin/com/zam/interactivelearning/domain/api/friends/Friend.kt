package com.zam.interactivelearning.domain.api.friends

data class Friend(
    val id: Long,
    val username: String,
    val score: Int,
    val dailyStreak: Int,
)