package com.zam.interactivelearning.domain.application.flashcard.converter

import com.zam.interactivelearning.domain.api.flashcard.Flashcard
import com.zam.interactivelearning.domain.application.flashcard.FlashcardEntity

fun FlashcardEntity.toFlashcard(): Flashcard {
    return Flashcard(
        id = id,
        content = content,
        answer = answer,
        createdBy = createdBy
    )
}