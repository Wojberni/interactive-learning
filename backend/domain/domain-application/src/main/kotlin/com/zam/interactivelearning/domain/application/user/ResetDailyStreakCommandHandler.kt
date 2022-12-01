package com.zam.interactivelearning.domain.application.user

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.domain.api.user.ResetDailyStreakCommand
import com.zam.interactivelearning.domain.application.user.persistence.UserEntity
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.transaction.annotation.Transactional
import kotlin.reflect.KClass

@Transactional
class ResetDailyStreakCommandHandler(
    private val userRepository: UserRepository,
    private val logger: Logger = LoggerFactory.getLogger(ResetDailyStreakCommandHandler::class.java)
): CommandHandler<ResetDailyStreakCommand, Unit> {

    override fun handle(command: ResetDailyStreakCommand) {
        userRepository.findAll().forEach {
            val result = it.resetDailyStreak()

            logResult(result, it)
        }
    }

    private fun logResult(result: Boolean, it: UserEntity) {
        if (result) {
            logger.info("Reset daily streak for user ${it.username}, since the update date was ${it.streakUpdatedAt}")
        } else {
            logger.info("Did not reset daily streak for user ${it.username}, since the update date was ${it.streakUpdatedAt}")
        }
    }

    override fun supportedClass(): KClass<ResetDailyStreakCommand> {
        return ResetDailyStreakCommand::class
    }

}