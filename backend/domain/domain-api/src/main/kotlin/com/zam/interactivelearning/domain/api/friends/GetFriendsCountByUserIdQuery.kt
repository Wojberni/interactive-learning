package com.zam.interactivelearning.domain.api.friends

import com.zam.interactivelearning.cqrs.Query

data class GetFriendsCountByUserIdQuery(
    val userId: Long
): Query<Int>