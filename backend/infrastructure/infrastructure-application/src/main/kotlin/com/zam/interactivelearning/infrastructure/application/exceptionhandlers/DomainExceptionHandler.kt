package com.zam.interactivelearning.infrastructure.application.exceptionhandlers

import com.zam.interactivelearning.domain.api.common.DomainException
import com.zam.interactivelearning.infrastructure.api.delivery.common.ApiErrorCodes
import com.zam.interactivelearning.infrastructure.api.delivery.common.ErrorResponse
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler
import java.time.LocalDateTime

@ControllerAdvice
class DomainExceptionHandler: ResponseEntityExceptionHandler() {

    @ExceptionHandler(DomainException::class)
    fun handleDomainException(domainException: DomainException): ResponseEntity<ErrorResponse> {
        val response = ErrorResponse(
            LocalDateTime.now(),
            HttpStatus.BAD_REQUEST.value(),
            domainException.message,
            ApiErrorCodes.exceptionToApiErrorCodeMap[domainException::class].orEmpty()
        )
        return ResponseEntity(response, HttpStatus.BAD_REQUEST)
    }
}