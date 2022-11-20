package com.zam.interactivelearning.domain.application.friends

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.common.DomainException
import com.zam.interactivelearning.domain.api.friends.GetFriendsCountByUserIdQuery
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import org.springframework.transaction.annotation.Transactional
import kotlin.reflect.KClass

@Transactional
class GetFriendsCountByUserIdQueryHandler(
    private val userRepository: UserRepository
): QueryHandler<GetFriendsCountByUserIdQuery, Int> {

    override fun handle(query: GetFriendsCountByUserIdQuery): Int {
        return userRepository.findById(query.userId)
            .orElseThrow { DomainException("User with id ${query.userId} not found") }
            .friends.size
    }

    override fun supportedClass(): KClass<GetFriendsCountByUserIdQuery> {
        return GetFriendsCountByUserIdQuery::class
    }

}