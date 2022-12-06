package com.zam.interactivelearning.domain.application.user

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.common.DomainException
import com.zam.interactivelearning.domain.api.friends.Friend
import com.zam.interactivelearning.domain.api.user.GetFriendsQuery
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import org.springframework.transaction.annotation.Transactional
import java.lang.IllegalStateException
import kotlin.reflect.KClass

@Transactional
class GetFriendsQueryHandler(
    private val userRepository: UserRepository
): QueryHandler<GetFriendsQuery, List<Friend>> {

    override fun handle(query: GetFriendsQuery): List<Friend> {
        val friends = userRepository.findById(query.userId)
            .orElseThrow { IllegalStateException("User with id ${query.userId} does not exist") }
            .friends
        return friends.map {
            Friend(
                it.id,
                it.username,
                it.quizScores.sumOf { it.score },
                it.dailyStreak
            )
        }
    }

    override fun supportedClass(): KClass<GetFriendsQuery> {
        return GetFriendsQuery::class
    }
}