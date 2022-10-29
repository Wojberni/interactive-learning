package com.zam.interactivelearning.domain.application.user.persistence

import org.springframework.data.repository.CrudRepository
import java.util.Optional

interface UserRepository: CrudRepository<UserEntity, Long> {
    fun existsByUsername(username: String): Boolean
    fun findByUsername(username: String): Optional<UserEntity>
}