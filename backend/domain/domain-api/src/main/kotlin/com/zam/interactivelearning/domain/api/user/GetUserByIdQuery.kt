package com.zam.interactivelearning.domain.api.user

import com.zam.interactivelearning.cqrs.Query

data class GetUserByIdQuery(
    val id: Long
): Query<User>