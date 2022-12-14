package com.zam.interactivelearning.infrastructure.application.delivery.user.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.friends.GetFriendsCountByUserIdQuery
import com.zam.interactivelearning.domain.api.user.GetFinishedActivitiesCountQuery
import com.zam.interactivelearning.domain.api.user.GetUserByIdQuery
import com.zam.interactivelearning.infrastructure.api.delivery.user.UserProfileResponse
import com.zam.interactivelearning.security.api.UserContextHolder

class UserEndpointHelper(
    private val executor: CqrsExecutor,
    private val contextHolder: UserContextHolder
) {
    fun getCurrentUserProfile(): UserProfileResponse {
        val user = executor.executeQuery(
            GetUserByIdQuery(contextHolder.getCurrentUser().id)
        )
        val friendsCount = executor.executeQuery(
            GetFriendsCountByUserIdQuery(contextHolder.getCurrentUser().id)
        )
        val finishedActivitiesCount = executor.executeQuery(
            GetFinishedActivitiesCountQuery(contextHolder.getCurrentUser().id)
        )

        return UserProfileResponse(
            user.username,
            user.email,
            finishedActivitiesCount,
            friendsCount,
            user.dailyStreak
        )
    }
}