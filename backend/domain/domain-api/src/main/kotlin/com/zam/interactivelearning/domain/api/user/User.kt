package com.zam.interactivelearning.domain.api.user

class User(
    val id: Long,
    val username: String,
    val email: String,
    val password: String,
    val roleNames: List<String>,
    val dailyStreak: Int,
)