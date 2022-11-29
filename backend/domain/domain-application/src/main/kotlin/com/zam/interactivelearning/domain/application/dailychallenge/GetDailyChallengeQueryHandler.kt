package com.zam.interactivelearning.domain.application.dailychallenge

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.dailychallenge.GetDailyChallengeQuery
import com.zam.interactivelearning.domain.api.quiz.Quiz
import com.zam.interactivelearning.domain.application.quiz.converter.toQuiz
import org.springframework.transaction.annotation.Transactional
import java.util.*
import kotlin.reflect.KClass

@Transactional
class GetDailyChallengeQueryHandler(
    private val repository: DailyChallengeRepository
): QueryHandler<GetDailyChallengeQuery, Quiz> {

    override fun handle(query: GetDailyChallengeQuery): Quiz {
        val challenge = Optional.ofNullable(repository.findAll().firstOrNull())
            .map {
                it.quiz
            }.orElseThrow { IllegalStateException("No daily challenge found") }
        return challenge.toQuiz()
    }

    override fun supportedClass(): KClass<GetDailyChallengeQuery> {
        return GetDailyChallengeQuery::class
    }

}