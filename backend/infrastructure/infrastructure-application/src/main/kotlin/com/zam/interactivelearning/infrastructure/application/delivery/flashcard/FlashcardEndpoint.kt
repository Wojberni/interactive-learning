package com.zam.interactivelearning.infrastructure.application.delivery.flashcard

import com.zam.interactivelearning.infrastructure.api.delivery.common.DefaultResponse
import com.zam.interactivelearning.infrastructure.api.delivery.flashcard.CreateFlashcardRequest
import com.zam.interactivelearning.infrastructure.api.delivery.flashcard.FlashcardDetailsResponse
import com.zam.interactivelearning.infrastructure.application.delivery.flashcard.helper.FlashcardEndpointHelper
import com.zam.interactivelearning.security.api.AuthenticatedUser
import io.swagger.v3.oas.annotations.Operation
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.*
import javax.validation.Valid

@RestController
@AuthenticatedUser
@RequestMapping("/flashcards")
class FlashcardEndpoint(
    val helper: FlashcardEndpointHelper
) {

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    @Operation(summary = "Create a flashcard")
    fun createFlashcard(@RequestBody @Valid request: CreateFlashcardRequest): DefaultResponse {
        helper.createFlashcard(request)
        return DefaultResponse()
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get a flashcard by id")
    fun getById(@PathVariable id: Long): FlashcardDetailsResponse {
        return helper.getById(id)
    }
}