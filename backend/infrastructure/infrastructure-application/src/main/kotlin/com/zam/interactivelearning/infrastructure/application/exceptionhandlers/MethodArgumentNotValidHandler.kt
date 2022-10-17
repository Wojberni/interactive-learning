package com.zam.interactivelearning.infrastructure.application.exceptionhandlers

import com.zam.interactivelearning.infrastructure.api.delivery.common.ValidationErrorResponse
import org.springframework.http.HttpHeaders
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.context.request.WebRequest
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler
import java.time.LocalDateTime


@ControllerAdvice
class MethodArgumentNotValidHandler: ResponseEntityExceptionHandler() {

    override fun handleMethodArgumentNotValid(
        ex: MethodArgumentNotValidException,
        headers: HttpHeaders,
        status: HttpStatus,
        request: WebRequest
    ): ResponseEntity<Any> {
        val errors = mutableMapOf<String, String>()
        for (error in ex.bindingResult.fieldErrors) {
            errors[error.field] = error.defaultMessage.orEmpty()
        }
        for (error in ex.bindingResult.globalErrors) {
            errors[error.objectName] = error.defaultMessage.orEmpty()
        }
        val response = ValidationErrorResponse(
            LocalDateTime.now(),
            HttpStatus.BAD_REQUEST.value(),
            errors
        )
        return handleExceptionInternal(ex, response, headers, HttpStatus.BAD_REQUEST, request);
    }
}