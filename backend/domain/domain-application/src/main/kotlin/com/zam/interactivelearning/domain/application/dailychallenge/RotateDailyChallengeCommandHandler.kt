package com.zam.interactivelearning.domain.application.dailychallenge

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.domain.api.dailychallenge.DailyChallengeChangedEvent
import com.zam.interactivelearning.domain.api.dailychallenge.RotateDailyChallengeCommand
import com.zam.interactivelearning.domain.application.quiz.QuizRepository
import com.zam.interactivelearning.events.EventPublisher
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.transaction.annotation.Transactional
import java.util.*
import kotlin.reflect.KClass

@Transactional
class RotateDailyChallengeCommandHandler(
    private val challengeRepository: DailyChallengeRepository,
    private val quizRepository: QuizRepository,
    private val eventPublisher: EventPublisher,
    private val logger: Logger = LoggerFactory.getLogger(RotateDailyChallengeCommandHandler::class.java)
): CommandHandler<RotateDailyChallengeCommand, Unit> {

    override fun handle(command: RotateDailyChallengeCommand) {
        val currentDailyChallenge = challengeRepository.findAll().firstOrNull()
        if (currentDailyChallenge == null) {
            logger.info("No daily challenge found, creating new one")
            val quiz = Optional.ofNullable(quizRepository.findAll().firstOrNull())
                .orElseThrow { IllegalStateException("No quiz found") }
            challengeRepository.save(DailyChallengeEntity(quiz = quiz))
            return
        }

        val quizzesCount = quizRepository.count()
        val nextQuizId = quizRepository.getNextDailyChallenge().id
        val nextQuiz = quizRepository.findById(nextQuizId).get()

        logger.info("Rotating daily challenge to quiz with id $nextQuizId")
        currentDailyChallenge.quiz = nextQuiz

        eventPublisher.publish(DailyChallengeChangedEvent())
    }

    override fun supportedClass(): KClass<RotateDailyChallengeCommand> {
        return RotateDailyChallengeCommand::class
    }
}