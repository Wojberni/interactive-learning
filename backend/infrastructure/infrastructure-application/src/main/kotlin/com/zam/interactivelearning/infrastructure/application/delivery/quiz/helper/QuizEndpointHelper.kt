package com.zam.interactivelearning.infrastructure.application.delivery.quiz.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.dailychallenge.GetDailyChallengeQuery
import com.zam.interactivelearning.domain.api.quiz.GetAllQuizzesQuery
import com.zam.interactivelearning.domain.api.quiz.GetQuizByIdQuery
import com.zam.interactivelearning.domain.api.quiz.SaveQuizScoreCommand
import com.zam.interactivelearning.domain.api.user.GetUsernameByIdQuery
import com.zam.interactivelearning.infrastructure.api.delivery.common.RequestValidator
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.*
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.converter.toCommand
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.converter.toQuizDetailsResponse
import com.zam.interactivelearning.security.api.UserContextHolder

class QuizEndpointHelper(
    private val executor: CqrsExecutor,
    private val requestValidator: RequestValidator<CreateQuizRequest>,
    private val contextHolder: UserContextHolder
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

    fun getDailyChallenge(): QuizDetailsResponse {
        return executor.executeQuery(GetDailyChallengeQuery())
            .toQuizDetailsResponse()
    }

    fun reportQuizScore(reportQuizScoreRequest: ReportQuizScoreRequest) {
        executor.executeCommand(SaveQuizScoreCommand(
            contextHolder.getCurrentUser().id,
            reportQuizScoreRequest.quizId,
            reportQuizScoreRequest.correctAnswersCount,
        ))
    }
}