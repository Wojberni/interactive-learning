package com.zam.interactivelearning.domain.application.user

import com.zam.interactivelearning.domain.api.quiz.QuizScoreSavedEvent
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import com.zam.interactivelearning.events.EventHandler
import org.springframework.transaction.annotation.Transactional

@Transactional
class IncrementDailyStreakEventHandler(
    val repository: UserRepository
): EventHandler<QuizScoreSavedEvent>() {

    override fun handle(event: QuizScoreSavedEvent) {
        val user = repository.findById(event.userId).orElseThrow()
        user.incrementDailyStreak()
    }

}