package com.zam.interactivelearning.domain.application.search

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.search.ActivityKind
import com.zam.interactivelearning.domain.api.search.SearchActivityQuery
import com.zam.interactivelearning.domain.api.search.SearchActivityResult
import com.zam.interactivelearning.domain.application.flashcard.FlashCardEntity
import com.zam.interactivelearning.domain.application.flashcard.FlashcardRepository
import com.zam.interactivelearning.domain.application.quiz.QuizEntity
import com.zam.interactivelearning.domain.application.quiz.QuizRepository
import kotlin.reflect.KClass

class SearchActivityQueryHandler(
    private val flashcardRepository: FlashcardRepository,
    private val quizRepository: QuizRepository
): QueryHandler<SearchActivityQuery, List<SearchActivityResult>> {

    override fun handle(query: SearchActivityQuery): List<SearchActivityResult> {
        if (query.query.isBlank()) {
            return quizRepository.findAll()
                .map { mapQuiz(it) }
                .plus(
                    flashcardRepository.findAll()
                    .map { mapFlashcard(it) }
                )
        }
        val quizzes = quizRepository.findALlByNameContainsIgnoreCaseOrDescriptionContainsIgnoreCase(query.query, query.query)
            .map { mapQuiz(it)}
        val flashcards = flashcardRepository.findAllByContentContainsIgnoreCase(query.query)
            .map { mapFlashcard(it) }
        return quizzes + flashcards
    }

    override fun supportedClass(): KClass<SearchActivityQuery> {
        return SearchActivityQuery::class
    }

    private fun mapQuiz(quiz: QuizEntity): SearchActivityResult {
        return SearchActivityResult(quiz.id, quiz.name, quiz.description, ActivityKind.QUIZ)
    }

    private fun mapFlashcard(flashcard: FlashCardEntity): SearchActivityResult {
        return SearchActivityResult(flashcard.id, flashcard.content, "", ActivityKind.FLASHCARD)
    }
}