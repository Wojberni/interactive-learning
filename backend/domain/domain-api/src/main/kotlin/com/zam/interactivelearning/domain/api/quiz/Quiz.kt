package com.zam.interactivelearning.domain.api.quiz

class Quiz(
    val id: Long,
    val name: String,
    val createdById: Long,
    val description: String,
    val questions: List<Question>
)