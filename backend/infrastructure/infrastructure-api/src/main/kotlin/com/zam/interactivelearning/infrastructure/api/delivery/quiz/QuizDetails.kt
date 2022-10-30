package com.zam.interactivelearning.infrastructure.api.delivery.quiz

import javax.validation.constraints.NotNull

data class QuizDetails(
    @get: NotNull
    val questions: List<QuizQuestion>
)
