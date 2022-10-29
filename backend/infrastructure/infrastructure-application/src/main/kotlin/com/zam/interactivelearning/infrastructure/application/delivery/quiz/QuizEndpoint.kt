package com.zam.interactivelearning.infrastructure.application.delivery.quiz

import com.zam.interactivelearning.infrastructure.api.delivery.common.EmptyResponse
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.CreateQuizRequest
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.helper.QuizEndpointHelper
import com.zam.interactivelearning.security.api.AuthenticatedUser
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestController
import javax.validation.Valid

@RestController
@RequestMapping("/quiz")
class QuizEndpoint(
    val helper: QuizEndpointHelper
) {

    @PostMapping()
    @ResponseStatus(HttpStatus.CREATED)
    @AuthenticatedUser
    fun createQuiz(@RequestBody @Valid createQuizRequest: CreateQuizRequest): EmptyResponse {
        helper.createQuiz(createQuizRequest)
        return EmptyResponse()
    }
}