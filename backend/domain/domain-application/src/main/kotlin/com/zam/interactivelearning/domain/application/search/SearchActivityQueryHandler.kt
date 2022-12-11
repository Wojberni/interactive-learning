package com.zam.interactivelearning.domain.application.search

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.search.ActivityKind
import com.zam.interactivelearning.domain.api.search.SearchActivityQuery
import com.zam.interactivelearning.domain.api.search.SearchActivityResult
import com.zam.interactivelearning.domain.application.flashcard.FlashcardRepository
import com.zam.interactivelearning.domain.application.quiz.QuizRepository
import kotlin.reflect.KClass

class SearchActivityQueryHandler(
    private val flashcardRepository: FlashcardRepository,
    private val quizRepository: QuizRepository
): QueryHandler<SearchActivityQuery, List<SearchActivityResult>> {

    override fun handle(query: SearchActivityQuery): List<SearchActivityResult> {
        val quizzes = quizRepository.findALlByNameContainsIgnoreCaseOrDescriptionContainsIgnoreCase(query.query, query.query)
            .map { SearchActivityResult(it.id, it.name, it.description, ActivityKind.QUIZ) }
        val flashcards = flashcardRepository.findAllByContentContainsIgnoreCase(query.query)
            .map { SearchActivityResult(it.id, it.content, "", ActivityKind.FLASHCARD) }
        return quizzes + flashcards
    }

    override fun supportedClass(): KClass<SearchActivityQuery> {
        return SearchActivityQuery::class
    }
}