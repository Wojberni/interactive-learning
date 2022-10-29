package com.zam.interactivelearning.domain.application.user.persistence

interface RoleRepository {
    fun findByName(name: String): RoleEntity
}