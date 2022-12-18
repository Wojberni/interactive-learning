package com.zam.interactivelearning.domain.application.quiz

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.quiz.GetRandomQuizQuery
import com.zam.interactivelearning.domain.api.quiz.Quiz
import com.zam.interactivelearning.domain.application.quiz.converter.toQuiz
import kotlin.reflect.KClass

class GetRandomQuizQueryHandler(
    private val quizRepository: QuizRepository
): QueryHandler<GetRandomQuizQuery, Quiz> {
    override fun handle(query: GetRandomQuizQuery): Quiz {
        return quizRepository
            .getRandomQuiz()
            .toQuiz()
    }

    override fun supportedClass(): KClass<GetRandomQuizQuery> {
        return GetRandomQuizQuery::class
    }
}