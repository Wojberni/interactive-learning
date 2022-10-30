package com.zam.interactivelearning.infrastructure.application.delivery.quiz.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.quiz.GetAllQuizzesQuery
import com.zam.interactivelearning.domain.api.user.GetUsernameByIdQuery
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.CreateQuizRequest
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.Quiz
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizListResponse
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.converter.toCommand

class QuizEndpointHelper(
    private val executor: CqrsExecutor,
) {
    fun createQuiz(createQuizRequest: CreateQuizRequest) {
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

    private fun getUsername(id: Long): String {
        return executor.executeQuery(GetUsernameByIdQuery(id))
    }
}