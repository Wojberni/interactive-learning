package com.zam.interactivelearning.domain.api.quiz

import com.zam.interactivelearning.cqrs.Query

data class GetQuizByIdQuery(
    val quizId: Long
): Query<Quiz>