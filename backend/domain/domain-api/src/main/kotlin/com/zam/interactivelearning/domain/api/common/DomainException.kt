package com.zam.interactivelearning.domain.api.common

open class DomainException(
    override val message: String
): RuntimeException()