package com.zam.interactivelearning.infrastructure.application.delivery.user.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
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

        // TODO: unhardcode the finished activities and friends count values when those features are implemented
        return UserProfileResponse(
            user.username,
            user.email,
            0,
            0,
            0
        )
    }
}