package com.zam.interactivelearning.domain.api.quiz

import com.zam.interactivelearning.cqrs.Command

data class CreateQuizCommand(
    val name: String,
    val description: String,
    val questions: List<Question>
): Command<Unit>