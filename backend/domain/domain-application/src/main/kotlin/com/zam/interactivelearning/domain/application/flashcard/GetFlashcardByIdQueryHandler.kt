package com.zam.interactivelearning.domain.application.flashcard

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.common.DomainException
import com.zam.interactivelearning.domain.api.flashcard.Flashcard
import com.zam.interactivelearning.domain.api.flashcard.GetFlashcardByIdQuery
import com.zam.interactivelearning.domain.application.flashcard.converter.toFlashcard
import kotlin.reflect.KClass

class GetFlashcardByIdQueryHandler(
    private val flashcardRepository: FlashcardRepository
): QueryHandler<GetFlashcardByIdQuery, Flashcard> {

    override fun handle(query: GetFlashcardByIdQuery): Flashcard {
        return flashcardRepository.findById(query.id)
            .orElseThrow { DomainException("Flashcard with id ${query.id} not found") }
            .toFlashcard()
    }

    override fun supportedClass(): KClass<GetFlashcardByIdQuery> {
        return GetFlashcardByIdQuery::class
    }
}