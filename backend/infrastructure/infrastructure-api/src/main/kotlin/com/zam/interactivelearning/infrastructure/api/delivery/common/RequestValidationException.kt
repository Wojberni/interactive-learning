package com.zam.interactivelearning.infrastructure.api.delivery.common

class RequestValidationException(
    override val message: String
): RuntimeException()