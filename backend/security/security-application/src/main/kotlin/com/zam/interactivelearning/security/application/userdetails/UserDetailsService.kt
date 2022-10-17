package com.zam.interactivelearning.security.application.userdetails

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.user.GetUserByUsernameQuery
import org.springframework.security.core.userdetails.UserDetails

class UserDetailsService(
    private val executor: CqrsExecutor
): org.springframework.security.core.userdetails.UserDetailsService {

        override fun loadUserByUsername(username: String): UserDetails {
            try {
                val user = executor.executeQuery(GetUserByUsernameQuery(username))
                return UserToUserDetailsConverter.convert(user)
            } catch (e: Exception) {
                throw IllegalArgumentException("user with username $username not found")
            }
        }
}