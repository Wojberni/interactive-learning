package com.zam.interactivelearning.security.application.userdetails

import com.zam.interactivelearning.domain.api.user.User
import com.zam.interactivelearning.security.api.ApplicationUserDetails
import org.springframework.security.core.authority.SimpleGrantedAuthority

class UserToUserDetailsConverter {

    companion object {
        fun convert(user: User): ApplicationUserDetails {
            return ApplicationUserDetails(
                id = user.id,
                username = user.username,
                password = user.password,
                authorities = user.roleNames.map { SimpleGrantedAuthority(it) }
            )
        }
    }
}

