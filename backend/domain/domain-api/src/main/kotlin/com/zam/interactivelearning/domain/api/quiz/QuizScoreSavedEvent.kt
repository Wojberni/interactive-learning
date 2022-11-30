package com.zam.interactivelearning.domain.api.quiz

import com.zam.interactivelearning.events.Event

data class QuizScoreSavedEvent(
    val quizId: Long,
    val userId: Long,
    val score: Int
): Event()