package com.zam.interactivelearning.domain.api.quiz

import com.zam.interactivelearning.cqrs.Command

data class CreateQuizCommand(
    val quiz: Quiz
): Command<Unit>