package com.zam.interactivelearning.domain.api.user

class User(
    val id: Long,
    val username: String,
    val password: String,
    val roleNames: List<String>
) {
}