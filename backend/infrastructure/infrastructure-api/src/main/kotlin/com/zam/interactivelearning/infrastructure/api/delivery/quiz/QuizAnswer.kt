package com.zam.interactivelearning.infrastructure.api.delivery.quiz

import com.fasterxml.jackson.annotation.JsonProperty
import javax.validation.constraints.NotBlank
import javax.validation.constraints.NotNull

data class QuizAnswer(
    @get: NotBlank(message = "Answer content cannot be blank")
    val content: String,
    @get: NotNull(message = "Answer isCorrect cannot be null")
    @get: JsonProperty("isCorrect")
    @field: JsonProperty("isCorrect")
    val isCorrect: Boolean
)