package com.zam.interactivelearning.security.api

import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.userdetails.UserDetails

class ApplicationUserDetails(
    val id: Long,
    private val username: String,
    private val password: String,
    private val authorities: List<GrantedAuthority>
): UserDetails {

    override fun getAuthorities(): List<GrantedAuthority> {
        return this.authorities
    }

    override fun getPassword(): String {
        return this.password
    }

    override fun getUsername(): String {
        return this.username
    }

    override fun isAccountNonExpired(): Boolean {
        return true
    }

    override fun isAccountNonLocked(): Boolean {
        return true
    }

    override fun isCredentialsNonExpired(): Boolean {
        return true
    }

    override fun isEnabled(): Boolean {
        return true
    }
}