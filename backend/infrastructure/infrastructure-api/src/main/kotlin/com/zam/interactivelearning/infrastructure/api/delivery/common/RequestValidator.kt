package com.zam.interactivelearning.infrastructure.api.delivery.common

interface RequestValidator<T> {
    fun validate(request: T)
}