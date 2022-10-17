package com.zam.interactivelearning.security.api

import com.zam.interactivelearning.cqrs.Command
data class LoginUserCommand(
    val username: String,
    val password: String
): Command<String> {
}