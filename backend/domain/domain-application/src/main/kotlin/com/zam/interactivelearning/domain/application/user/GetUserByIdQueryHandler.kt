package com.zam.interactivelearning.domain.application.user

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.user.GetUserByIdQuery
import com.zam.interactivelearning.domain.api.user.User
import com.zam.interactivelearning.domain.application.user.converter.toUser
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import kotlin.reflect.KClass

class GetUserByIdQueryHandler(
    private val userRepository: UserRepository
): QueryHandler<GetUserByIdQuery, User> {
    override fun handle(query: GetUserByIdQuery): User {
        return userRepository.findById(query.id)
            .orElseThrow { IllegalArgumentException() }
            .toUser()
    }

    override fun supportedClass(): KClass<GetUserByIdQuery> {
        return GetUserByIdQuery::class
    }
}