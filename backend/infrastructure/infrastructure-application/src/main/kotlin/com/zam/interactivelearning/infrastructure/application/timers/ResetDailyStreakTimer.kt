package com.zam.interactivelearning.infrastructure.application.timers

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.user.ResetDailyStreakCommand
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.scheduling.annotation.Scheduled

class ResetDailyStreakTimer(
    private val executor: CqrsExecutor,
    private val logger: Logger = LoggerFactory.getLogger(ResetDailyStreakTimer::class.java)
) {

    @Scheduled(cron = "@midnight")
    fun resetDailyStreak() {
        logger.info("running scheduled daily streak reset")
        executor.executeCommand(ResetDailyStreakCommand())
    }
}