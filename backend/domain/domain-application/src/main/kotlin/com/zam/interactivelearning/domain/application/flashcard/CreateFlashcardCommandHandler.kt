package com.zam.interactivelearning.domain.application.flashcard

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.domain.api.flashcard.CreateFlashcardCommand
import com.zam.interactivelearning.security.api.UserContextHolder
import kotlin.reflect.KClass

class CreateFlashcardCommandHandler(
    private val flashcardRepository: FlashcardRepository,
    private val contextHolder: UserContextHolder
): CommandHandler<CreateFlashcardCommand, Unit> {

    override fun handle(command: CreateFlashcardCommand) {
        flashcardRepository.save(
            FlashcardEntity(
                content = command.content,
                answer = command.answer,
                createdBy = contextHolder.getCurrentUser().id
            )
        )
    }

    override fun supportedClass(): KClass<CreateFlashcardCommand> {
        return CreateFlashcardCommand::class
    }
}
