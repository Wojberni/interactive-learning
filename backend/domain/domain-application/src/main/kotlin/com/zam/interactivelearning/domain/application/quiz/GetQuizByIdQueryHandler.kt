package com.zam.interactivelearning.domain.application.quiz

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.common.DomainException
import com.zam.interactivelearning.domain.api.quiz.GetQuizByIdQuery
import com.zam.interactivelearning.domain.api.quiz.Quiz
import com.zam.interactivelearning.domain.application.quiz.converter.toQuiz
import kotlin.reflect.KClass

class GetQuizByIdQueryHandler(
    private val quizRepository: QuizRepository
): QueryHandler<GetQuizByIdQuery, Quiz> {

    override fun handle(query: GetQuizByIdQuery): Quiz {
        val quizEntity = quizRepository.findById(query.quizId)
            .orElseThrow { DomainException("quiz with id ${query.quizId} not found") }
        return quizEntity.toQuiz()
    }

    override fun supportedClass(): KClass<GetQuizByIdQuery> {
        return GetQuizByIdQuery::class
    }


}