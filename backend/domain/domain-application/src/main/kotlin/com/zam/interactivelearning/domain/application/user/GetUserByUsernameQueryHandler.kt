package com.zam.interactivelearning.domain.application.user

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.common.DomainException
import com.zam.interactivelearning.domain.api.user.User
import com.zam.interactivelearning.domain.api.user.GetUserByUsernameQuery
import com.zam.interactivelearning.domain.application.user.converter.toUser
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import kotlin.reflect.KClass

class GetUserByUsernameQueryHandler(
    private val userRepository: UserRepository
): QueryHandler<GetUserByUsernameQuery, User> {
    override fun handle(query: GetUserByUsernameQuery): User {
        return userRepository.findByUsername(query.username)
            .orElseThrow { DomainException("User with username ${query.username} not found") }
            .toUser()
    }

    override fun supportedClass(): KClass<GetUserByUsernameQuery> {
        return GetUserByUsernameQuery::class
    }
}