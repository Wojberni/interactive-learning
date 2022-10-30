package com.zam.interactivelearning.infrastructure.api.delivery.quiz

import javax.validation.constraints.NotNull

data class Quiz(
    @get: NotNull
    val id: Long,
    @get: NotNull
    val name: String,
    @get: NotNull
    val description: String,
    @get: NotNull
    val createdByUsername: String,
)