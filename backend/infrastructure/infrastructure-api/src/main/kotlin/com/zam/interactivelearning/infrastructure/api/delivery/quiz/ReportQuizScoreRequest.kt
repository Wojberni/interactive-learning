package com.zam.interactivelearning.infrastructure.api.delivery.quiz

import javax.validation.constraints.NotNull

data class ReportQuizScoreRequest(
    @get: NotNull(message = "quizId is required")
    val quizId: Long,
    @get: NotNull(message = "correctAnswersCount is required")
    val correctAnswersCount: Int,
)