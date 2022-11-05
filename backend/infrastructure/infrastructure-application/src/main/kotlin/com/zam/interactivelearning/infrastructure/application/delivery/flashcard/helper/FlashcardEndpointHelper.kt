package com.zam.interactivelearning.infrastructure.application.delivery.flashcard.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.flashcard.CreateFlashcardCommand
import com.zam.interactivelearning.domain.api.flashcard.GetFlashcardByIdQuery
import com.zam.interactivelearning.infrastructure.api.delivery.flashcard.CreateFlashcardRequest
import com.zam.interactivelearning.infrastructure.api.delivery.flashcard.FlashcardDetailsResponse

class FlashcardEndpointHelper(
    private val executor: CqrsExecutor
) {

    fun createFlashcard(request: CreateFlashcardRequest) {
        return executor.executeCommand(
            CreateFlashcardCommand(
                content = request.content,
                answer = request.answer
            )
        )
    }

    fun getById(id: Long): FlashcardDetailsResponse {
        val flashcard = executor.executeQuery(GetFlashcardByIdQuery(id))
        return FlashcardDetailsResponse(
            id = flashcard.id,
            content = flashcard.content,
            answer = flashcard.answer
        )
    }
}