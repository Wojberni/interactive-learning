package com.zam.interactivelearning.security.api

import org.springframework.security.access.prepost.PreAuthorize

@Retention(AnnotationRetention.RUNTIME)
@PreAuthorize("hasRole('ROLE_USER')")
annotation class AuthenticatedUser()
