package com.zam.interactivelearning.security.api

interface UserContextHolder {

    fun getCurrentUser(): ApplicationUserDetails
}