package com.zam.interactivelearning.domain.application.quiz

import com.zam.interactivelearning.domain.api.notifications.SendNotificationEvent
import com.zam.interactivelearning.domain.api.quiz.QuizScoreSavedEvent
import com.zam.interactivelearning.domain.application.notifications.NotificationTemplateRepository
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import com.zam.interactivelearning.events.EventHandler
import com.zam.interactivelearning.events.EventPublisher
import org.springframework.transaction.annotation.Transactional
import java.lang.IllegalStateException
import java.util.*

@Transactional
class SendFriendAchievedHigherScoreNotificationEventHandler(
    private val notificationTemplateRepository: NotificationTemplateRepository,
    private val quizScoreRepository: QuizScoreRepository,
    private val quizRepository: QuizRepository,
    private val userRepository: UserRepository,
    private val eventPublisher: EventPublisher
): EventHandler<QuizScoreSavedEvent>() {

    override fun handle(event: QuizScoreSavedEvent) {
        val user = userRepository.findById(event.userId).orElseThrow()
        val friends = user.friends

        friends.forEach {
            val highScore = quizScoreRepository.findTopByUserIdAndQuizIdOrderByScore(it.id, event.quizId)
            if (highScore != null && highScore.score < event.score) {
                val quiz = quizRepository.findById(event.quizId).orElseThrow()
                val template = Optional.ofNullable(
                    notificationTemplateRepository.findByNotificationName("FRIEND_ACHIEVED_HIGHER_SCORE")
                ).orElseThrow{ IllegalStateException("Notification template not found") }
                val content = String.format(template.notificationTemplate, user.username, quiz.name)

                eventPublisher.publish(SendNotificationEvent(it.id, template.notificationTitle, content))
            }
        }
    }
}