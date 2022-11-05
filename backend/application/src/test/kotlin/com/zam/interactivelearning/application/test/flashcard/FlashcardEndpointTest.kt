package com.zam.interactivelearning.application.test.flashcard

import com.zam.interactivelearning.application.AuthenticatedTest
import com.zam.interactivelearning.application.IntegrationTest
import com.zam.interactivelearning.domain.application.flashcard.FlashcardEntity
import com.zam.interactivelearning.domain.application.flashcard.FlashcardRepository
import com.zam.interactivelearning.infrastructure.api.delivery.flashcard.CreateFlashcardRequest
import io.restassured.module.mockmvc.RestAssuredMockMvc
import io.restassured.module.mockmvc.kotlin.extensions.Given
import io.restassured.module.mockmvc.kotlin.extensions.Then
import io.restassured.module.mockmvc.kotlin.extensions.When
import org.hamcrest.Matchers.equalTo
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.context.WebApplicationContext

@IntegrationTest
class FlashcardEndpointTest(
    @Autowired
    val webApplicationContext: WebApplicationContext,
    @Autowired
    val flashcardRepository: FlashcardRepository
) : AuthenticatedTest() {

    @BeforeEach
    fun setup() {
        RestAssuredMockMvc.webAppContextSetup(webApplicationContext)
    }

    @Test
    fun `should create a new flashcard`() {
        Given {
            header(getAuthHeader(userJwt))
            body(getCreateFlashcardRequest())
        } When {
            post("/flashcards")
        } Then {
            statusCode(201)

            assertEquals(1, flashcardRepository.count())
        }
    }

    @Test
    fun `should get a flashcard by id`() {
        val created = insertFlashcard()
        Given {
            header(getAuthHeader(userJwt))
        } When {
            get("/flashcards/${created.id}")
        } Then {
            statusCode(200)

            body("id.toString()", equalTo(created.id.toString()))
            body("content", equalTo("front"))
            body("answer", equalTo("back"))
        }
    }


    private fun getCreateFlashcardRequest(): CreateFlashcardRequest {
        return CreateFlashcardRequest(
            content = "What is the capital of France?",
            answer = "Paris"
        )
    }

    private fun insertFlashcard(): FlashcardEntity {
        return flashcardRepository.save(
            FlashcardEntity(
                content = "front",
                answer = "back",
                createdBy = 1
            )
        )
    }

}