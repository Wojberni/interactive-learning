package com.zam.interactivelearning.domain.application.quiz

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.quiz.SaveQuizScoreCommand
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import org.springframework.transaction.annotation.Transactional
import kotlin.reflect.KClass

@Transactional
class SaveQuizScoreCommandHandler(
    private val quizScoreRepository: QuizScoreRepository,
    private val userRepository: UserRepository,
    private val quizRepository: QuizRepository,
    private val executor: CqrsExecutor
): CommandHandler<SaveQuizScoreCommand, Unit> {
    override fun handle(command: SaveQuizScoreCommand) {
        val user = userRepository.findById(command.userId).orElseThrow()
        val quiz = quizRepository.findById(command.quizId).orElseThrow()

        quizScoreRepository.save(QuizScoreEntity(
            quiz = quiz,
            user = user,
            score = command.score
        ))
    }

    override fun supportedClass(): KClass<SaveQuizScoreCommand> {
        return SaveQuizScoreCommand::class
    }
}