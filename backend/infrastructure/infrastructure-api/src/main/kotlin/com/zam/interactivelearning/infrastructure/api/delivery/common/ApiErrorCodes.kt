package com.zam.interactivelearning.infrastructure.api.delivery.common

import com.zam.interactivelearning.domain.api.common.DomainException
import com.zam.interactivelearning.domain.api.user.EmailExistsException
import com.zam.interactivelearning.domain.api.user.UsernameExistsException
import kotlin.reflect.KClass

class ApiErrorCodes {
    companion object {
        val exceptionToApiErrorCodeMap: Map<KClass<out DomainException>, String> =
            mapOf(
                UsernameExistsException::class to "ERR_USERNAME_EXISTS",
                EmailExistsException::class to "ERR_EMAIL_EXISTS"
            )
    }
}