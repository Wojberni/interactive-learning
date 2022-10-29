package com.zam.interactivelearning.domain.application.user.persistence

class RoleRepositoryImpl(
    private val springDataRoleRepository: SpringDataRoleRepository,
    private val cache: MutableMap<String, RoleEntity>
): RoleRepository {

    override fun findByName(name: String): RoleEntity {
        if (cache.containsKey(name)) {
            return cache[name]!!
        }
        val role = springDataRoleRepository.findByName(name)
        cache[name] = role
        return role
    }
}