package com.zam.interactivelearning.infrastructure.application.exceptionhandlers

import com.zam.interactivelearning.infrastructure.api.delivery.common.ErrorResponse
import com.zam.interactivelearning.infrastructure.api.delivery.common.RequestValidationException
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler
import java.time.LocalDateTime

@ControllerAdvice
class RequestValidationExceptionHandler: ResponseEntityExceptionHandler() {

    @ExceptionHandler(RequestValidationException::class)
    fun handleDomainException(ex: RequestValidationException): ResponseEntity<ErrorResponse> {
        val response = ErrorResponse(
            LocalDateTime.now(),
            HttpStatus.BAD_REQUEST.value(),
            ex.message
        )
        return ResponseEntity(response, HttpStatus.BAD_REQUEST)
    }
}