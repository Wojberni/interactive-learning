package com.zam.interactivelearning.domain.application.user

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.user.User
import com.zam.interactivelearning.domain.api.user.GetUserByUsernameQuery
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import kotlin.reflect.KClass

class GetUserByUsernameQueryHandler(
    val userRepository: UserRepository
): QueryHandler<GetUserByUsernameQuery, User> {
    override fun handle(query: GetUserByUsernameQuery): User {
        val user = userRepository.findByUsername(query.username)
            .orElseThrow { IllegalArgumentException() }

        return User(
            id = user.id,
            username = user.username,
            password = user.password,
            roleNames = user.roles.map { it.name }
        )
    }

    override fun supportedClass(): KClass<GetUserByUsernameQuery> {
        return GetUserByUsernameQuery::class
    }
}