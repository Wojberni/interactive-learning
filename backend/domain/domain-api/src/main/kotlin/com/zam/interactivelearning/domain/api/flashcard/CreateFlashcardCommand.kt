package com.zam.interactivelearning.domain.api.flashcard

import com.zam.interactivelearning.cqrs.Command

data class CreateFlashcardCommand(
    val content: String,
    val answer: String,
): Command<Unit>