package com.zam.interactivelearning.domain.application.notifications

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.domain.api.notifications.RegisterOrUpdateDeviceTokenCommand
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import com.zam.interactivelearning.security.api.UserContextHolder
import org.springframework.transaction.annotation.Transactional
import java.time.LocalDateTime
import java.util.*
import kotlin.reflect.KClass

@Transactional
class RegisterOrUpdateDeviceTokenCommandHandler(
    private val repository: UserRepository,
    private val contextHolder: UserContextHolder
): CommandHandler<RegisterOrUpdateDeviceTokenCommand, Unit> {

    override fun handle(command: RegisterOrUpdateDeviceTokenCommand) {
        val user = repository.findById(contextHolder.getCurrentUser().id)
            .orElseThrow { IllegalStateException("User not found") }

        if (user.notificationTarget == null) {
            user.notificationTarget = NotificationTargetEntity(
                user = user,
                targetFirebaseToken = command.token,
            )
        } else {
            user.notificationTarget!!.targetFirebaseToken = command.token
            user.notificationTarget!!.updatedAt = LocalDateTime.now()
        }
    }

    override fun supportedClass(): KClass<RegisterOrUpdateDeviceTokenCommand> {
        return RegisterOrUpdateDeviceTokenCommand::class
    }
}