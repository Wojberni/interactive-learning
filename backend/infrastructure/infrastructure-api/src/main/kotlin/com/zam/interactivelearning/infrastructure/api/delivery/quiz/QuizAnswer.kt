package com.zam.interactivelearning.infrastructure.api.delivery.quiz

import javax.validation.constraints.NotBlank
import javax.validation.constraints.NotNull

data class QuizAnswer(
    @get: NotBlank(message = "Answer content cannot be blank")
    val content: String,
    @get: NotNull(message = "Answer isCorrect cannot be null")
    val isCorrect: Boolean
)