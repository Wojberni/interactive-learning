package com.zam.interactivelearning.domain.application.user

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.user.GetFinishedActivitiesCountQuery
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import org.springframework.transaction.annotation.Transactional
import kotlin.reflect.KClass

@Transactional
class GetFinishedActivitiesCountQueryHandler(
    private val repository: UserRepository
): QueryHandler<GetFinishedActivitiesCountQuery, Int> {
    override fun handle(query: GetFinishedActivitiesCountQuery): Int {
        val user = repository.findById(query.userId).orElseThrow()
        return user.quizScores.size
    }

    override fun supportedClass(): KClass<GetFinishedActivitiesCountQuery> {
        return GetFinishedActivitiesCountQuery::class
    }
}