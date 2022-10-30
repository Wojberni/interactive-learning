package com.zam.interactivelearning.infrastructure.api.delivery.quiz

import javax.validation.constraints.NotNull

data class QuizDetailsResponse(
    @get: NotNull
    val quizId: Long,
    @get: NotNull
    val questions: List<QuizQuestion>
)
