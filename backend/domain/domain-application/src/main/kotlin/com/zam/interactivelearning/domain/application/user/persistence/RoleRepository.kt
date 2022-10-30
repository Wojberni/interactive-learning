package com.zam.interactivelearning.domain.application.user.persistence

import org.springframework.cache.annotation.Cacheable
import org.springframework.data.repository.CrudRepository

interface RoleRepository: CrudRepository<RoleEntity, Long> {

    @Cacheable("roles")
    fun findByName(name: String): RoleEntity
}