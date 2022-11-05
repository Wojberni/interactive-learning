package com.zam.interactivelearning.infrastructure.api.delivery.flashcard

import javax.validation.constraints.NotBlank

class CreateFlashcardRequest(
    @get: NotBlank
    val content: String,
    @get: NotBlank
    val answer: String,
)