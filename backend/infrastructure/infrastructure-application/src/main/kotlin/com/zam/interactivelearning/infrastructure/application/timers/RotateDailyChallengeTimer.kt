package com.zam.interactivelearning.infrastructure.application.timers

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.dailychallenge.RotateDailyChallengeCommand
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.scheduling.annotation.Scheduled

class RotateDailyChallengeTimer(
    private val executor: CqrsExecutor,
    private val logger: Logger = LoggerFactory.getLogger(RotateDailyChallengeTimer::class.java)
) {

    @Scheduled(cron = "@midnight")
    fun rotateDailyChallenge() {
        logger.info("running scheduled daily challenge rotation")
        executor.executeCommand(RotateDailyChallengeCommand())
    }
}