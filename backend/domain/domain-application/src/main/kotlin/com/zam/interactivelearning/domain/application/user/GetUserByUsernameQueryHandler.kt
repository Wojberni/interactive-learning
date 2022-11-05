package com.zam.interactivelearning.domain.application.user

import com.zam.interactivelearning.cqrs.QueryHandler
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
            .orElseThrow { IllegalArgumentException() }
            .toUser()
    }

    override fun supportedClass(): KClass<GetUserByUsernameQuery> {
        return GetUserByUsernameQuery::class
    }
}