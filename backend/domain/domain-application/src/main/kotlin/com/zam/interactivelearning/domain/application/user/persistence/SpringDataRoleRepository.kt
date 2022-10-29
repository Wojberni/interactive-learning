package com.zam.interactivelearning.domain.application.user.persistence

import org.springframework.data.repository.CrudRepository

interface SpringDataRoleRepository: CrudRepository<RoleEntity, Long> {
    fun findByName(name: String): RoleEntity
}