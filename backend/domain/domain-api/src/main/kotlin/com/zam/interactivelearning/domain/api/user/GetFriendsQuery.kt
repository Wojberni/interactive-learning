package com.zam.interactivelearning.domain.api.user

import com.zam.interactivelearning.cqrs.Query
import com.zam.interactivelearning.domain.api.friends.Friend

data class GetFriendsQuery(
    val userId: Long
): Query<List<Friend>>