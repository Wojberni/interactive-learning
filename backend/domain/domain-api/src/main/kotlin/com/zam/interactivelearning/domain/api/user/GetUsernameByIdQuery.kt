package com.zam.interactivelearning.domain.api.user

import com.zam.interactivelearning.cqrs.Query

data class GetUsernameByIdQuery(
    val id: Long
): Query<String>