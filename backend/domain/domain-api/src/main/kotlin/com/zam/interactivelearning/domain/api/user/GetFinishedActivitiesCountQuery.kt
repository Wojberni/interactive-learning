package com.zam.interactivelearning.domain.api.user

import com.zam.interactivelearning.cqrs.Query

data class GetFinishedActivitiesCountQuery(
    val userId: Long
): Query<Int>