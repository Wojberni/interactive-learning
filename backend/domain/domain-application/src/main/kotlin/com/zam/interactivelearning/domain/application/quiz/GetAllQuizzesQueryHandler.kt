package com.zam.interactivelearning.domain.application.quiz

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.quiz.GetAllQuizzesQuery
import com.zam.interactivelearning.domain.api.quiz.Quiz
import kotlin.reflect.KClass

class GetAllQuizzesQueryHandler(
    private val quizRepository: QuizRepository
): QueryHandler<GetAllQuizzesQuery, List<Quiz>> {

    override fun handle(query: GetAllQuizzesQuery): List<Quiz> {
        return quizRepository.findAll().map {
            Quiz(
                it.id,
                it.name,
                it.createdBy,
                it.description,
                listOf()
            )
        }
    }

    override fun supportedClass(): KClass<GetAllQuizzesQuery> {
        return GetAllQuizzesQuery::class
    }
}