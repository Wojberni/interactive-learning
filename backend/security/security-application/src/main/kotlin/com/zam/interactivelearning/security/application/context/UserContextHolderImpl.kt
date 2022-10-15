package com.zam.interactivelearning.security.application.context

import com.zam.interactivelearning.security.api.ApplicationUserDetails
import com.zam.interactivelearning.security.api.UserContextHolder
import org.springframework.security.core.context.SecurityContextHolder

class UserContextHolderImpl: UserContextHolder {
    override fun getCurrentUser(): ApplicationUserDetails {
        val currentUser = SecurityContextHolder.getContext().authentication.principal
        if (currentUser is ApplicationUserDetails) {
            return currentUser
        } else {
            throw IllegalStateException("Tried to get current user but it was not set")
        }
    }
}