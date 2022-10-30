package com.zam.interactivelearning.domain.application.user

import com.zam.interactivelearning.cqrs.QueryHandler
import com.zam.interactivelearning.domain.api.user.GetUsernameByIdQuery
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import kotlin.reflect.KClass

class GetUsernameByIdQueryHandler(
    private val userRepository: UserRepository
): QueryHandler<GetUsernameByIdQuery, String> {

    override fun handle(query: GetUsernameByIdQuery): String {
        return userRepository
            .findUsernameById(query.id)
            .getUsername()
    }

    override fun supportedClass(): KClass<GetUsernameByIdQuery> {
        return GetUsernameByIdQuery::class
    }
}