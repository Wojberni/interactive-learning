package com.zam.interactivelearning.infrastructure.application.delivery.flashcard

import com.zam.interactivelearning.infrastructure.api.delivery.common.EmptyResponse
import com.zam.interactivelearning.infrastructure.api.delivery.flashcard.CreateFlashcardRequest
import com.zam.interactivelearning.infrastructure.api.delivery.flashcard.FlashcardDetailsResponse
import com.zam.interactivelearning.infrastructure.application.delivery.flashcard.helper.FlashcardEndpointHelper
import io.swagger.v3.oas.annotations.Operation
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*
import javax.validation.Valid

@RestController
@RequestMapping("/flashcards")
class FlashcardEndpoint(
    val helper: FlashcardEndpointHelper
) {

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    @Operation(summary = "Create a flashcard")
    fun createFlashcard(@RequestBody @Valid request: CreateFlashcardRequest): EmptyResponse {
        helper.createFlashcard(request)
        return EmptyResponse()
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get a flashcard by id")
    fun getById(@PathVariable id: Long): FlashcardDetailsResponse {
        return helper.getById(id)
    }
}