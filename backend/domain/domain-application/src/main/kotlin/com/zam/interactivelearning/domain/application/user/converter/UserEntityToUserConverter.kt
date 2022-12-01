package com.zam.interactivelearning.domain.application.user.converter

import com.zam.interactivelearning.domain.api.user.User
import com.zam.interactivelearning.domain.application.user.persistence.UserEntity

fun UserEntity.toUser(): User {
    return User(
        this.id,
        this.username,
        this.email,
        this.password,
        this.roles.map { it.name },
        this.dailyStreak
    )
}