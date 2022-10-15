package com.zam.interactivelearning.domain.api.user

import com.zam.interactivelearning.cqrs.Query


data class GetUserByUsernameQuery(
    val username: String
): Query<User> {
}