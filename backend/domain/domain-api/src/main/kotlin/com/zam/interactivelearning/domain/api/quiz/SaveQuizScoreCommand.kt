package com.zam.interactivelearning.domain.api.quiz

import com.zam.interactivelearning.cqrs.Command

data class SaveQuizScoreCommand(
    val userId: Long,
    val quizId: Long,
    val score: Int
): Command<Unit>