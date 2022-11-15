package com.zam.interactivelearning.infrastructure.application.delivery.quiz.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.quiz.GetAllQuizzesQuery
import com.zam.interactivelearning.domain.api.quiz.GetQuizByIdQuery
import com.zam.interactivelearning.domain.api.user.GetUsernameByIdQuery
import com.zam.interactivelearning.infrastructure.api.delivery.common.RequestValidator
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.CreateQuizRequest
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.Quiz
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizDetailsResponse
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizListResponse
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.converter.toCommand
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.converter.toQuizDetailsResponse

class QuizEndpointHelper(
    private val executor: CqrsExecutor,
    private val requestValidator: RequestValidator<CreateQuizRequest>
) {
    fun createQuiz(createQuizRequest: CreateQuizRequest) {
        requestValidator.validate(createQuizRequest)
        executor.executeCommand(createQuizRequest.toCommand())
    }

    fun getAllQuizzes(): QuizListResponse {
        val quizzes = executor.executeQuery(GetAllQuizzesQuery())
        return QuizListResponse(
            quizzes = quizzes.map {
                Quiz(
                    it.id,
                    it.name,
                    it.description,
                    getUsername(it.createdById)
                )
            }
        )
    }

    fun getQuizById(id: Long): QuizDetailsResponse {
        return executor.executeQuery(GetQuizByIdQuery(id))
            .toQuizDetailsResponse()
    }

    private fun getUsername(id: Long): String {
        return executor.executeQuery(GetUsernameByIdQuery(id))
    }
}