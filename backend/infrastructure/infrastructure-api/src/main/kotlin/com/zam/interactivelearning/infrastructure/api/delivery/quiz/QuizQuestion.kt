package com.zam.interactivelearning.infrastructure.api.delivery.quiz

import javax.validation.constraints.NotBlank
import javax.validation.constraints.Size

data class QuizQuestion(
    @get: NotBlank(message = "Question content cannot be blank")
    val content: String,
    @get: Size(min = 2, message = "Question must have at least 2 answers")
    @get: Size(max = 4, message = "Question must have at most 4 answers")
    val answers: List<QuizAnswer>
)