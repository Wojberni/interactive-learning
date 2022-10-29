package com.zam.interactivelearning.infrastructure.api.delivery.quiz

import javax.validation.constraints.NotBlank
import javax.validation.constraints.Size

data class CreateQuizRequest(
    @get: NotBlank(message = "Quiz name cannot be blank")
    val name: String,
    @get: NotBlank(message = "Quiz description cannot be blank")
    val description: String,
    @get: Size(min = 1, message = "Quiz must have at least 1 question")
    val questions: List<QuizQuestion>
)