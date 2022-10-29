package com.zam.interactivelearning.domain.api.quiz

class Quiz(
    val name: String,
    val description: String,
    val questions: List<Question>
)