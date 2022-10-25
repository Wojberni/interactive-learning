package com.zam.interactivelearning.domain.api.user

import com.zam.interactivelearning.cqrs.Command

data class CreateUserCommand(
    val email: String,
    val username: String,
    val password: String,
): Command<Unit> {
}