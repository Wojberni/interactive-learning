package com.zam.interactivelearning.domain.api.flashcard

import com.zam.interactivelearning.cqrs.Query

data class GetFlashcardByIdQuery(
    val id: Long
): Query<Flashcard>