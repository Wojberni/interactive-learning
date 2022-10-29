package com.zam.interactivelearning.application.test.quiz

import com.zam.interactivelearning.application.AuthenticatedTest
import com.zam.interactivelearning.application.IntegrationTest
import com.zam.interactivelearning.domain.application.quiz.QuizRepository
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.CreateQuizRequest
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizAnswer
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizQuestion
import io.restassured.module.mockmvc.RestAssuredMockMvc
import io.restassured.module.mockmvc.kotlin.extensions.Given
import io.restassured.module.mockmvc.kotlin.extensions.Then
import io.restassured.module.mockmvc.kotlin.extensions.When
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.context.WebApplicationContext

@IntegrationTest
class QuizEndpointTest(
    @Autowired
    val webApplicationContext: WebApplicationContext,
    @Autowired
    val quizRepository: QuizRepository,
): AuthenticatedTest() {

    @BeforeEach
    fun setup() {
        RestAssuredMockMvc.webAppContextSetup(webApplicationContext)
    }

    @Test
    @Transactional
    fun `should create a new quiz`() {
        val request = getCreateQuizRequest()
        Given {
            header(getAuthHeader(userJwt))
            body(request)
        } When {
            post("/quiz")
        } Then {
            statusCode(201)

            assertEquals(1, quizRepository.count())

            val created = quizRepository.findAll().first()
            assertEquals(request.name, created.name)
            assertEquals(created.id, created.questions.first().quiz.id)
            assertEquals(request.questions.first().content, created.questions.first().content)
            assertEquals(request.questions.first().answers.count(), created.questions.first().answers.count())
        }
    }

    private fun getCreateQuizRequest(): CreateQuizRequest {
        return CreateQuizRequest(
            "Polish monarchs",
            "Check your knowledge on historical Polish monarchs",
            questions = listOf(
                QuizQuestion(
                    "Who was the first Polish king?",
                    listOf(
                        QuizAnswer("Bolesław I Chrobry", true),
                        QuizAnswer("Mieszko I", false),
                        QuizAnswer("Władysław I Herman", false),
                        QuizAnswer("Władysław II Jagiełło", false)
                    )
                )
            )
        )
    }
}