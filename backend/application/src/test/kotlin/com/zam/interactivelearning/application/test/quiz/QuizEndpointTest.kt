package com.zam.interactivelearning.application.test.quiz

import com.zam.interactivelearning.application.AuthenticatedTest
import com.zam.interactivelearning.application.IntegrationTest
import com.zam.interactivelearning.domain.application.quiz.AnswerEntity
import com.zam.interactivelearning.domain.application.quiz.QuestionEntity
import com.zam.interactivelearning.domain.application.quiz.QuizEntity
import com.zam.interactivelearning.domain.application.quiz.QuizRepository
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.*
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
) : AuthenticatedTest() {

    @BeforeEach
    fun setup() {
        RestAssuredMockMvc.webAppContextSetup(webApplicationContext)
    }

    @Test
    @Transactional
    fun `should create a new quiz`() {
        quizRepository.deleteAll()
        val request = getCreateQuizRequest()

        Given {
            header(getAuthHeader(userJwt))
            body(request)
        } When {
            post("/quizzes")
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

    @Test
    fun `should get all quizzes`() {
        Given {
            header(getAuthHeader(userJwt))
        } When {
            get("/quizzes")
                .prettyPeek()
        } Then {
            statusCode(200)

            val response = extract().body().`as`(QuizListResponse::class.java)
            assertEquals(2, response.quizzes.size)
            response.quizzes.map {
                assertEquals("test_user", it.createdByUsername)
            }
        }
    }

    @Test
    @Transactional
    fun `should get quiz details by id`() {
        val existing = quizRepository.findAll().first()

        Given {
            header(getAuthHeader(userJwt))
        } When {
            get("/quizzes/${existing.id}")
                .prettyPeek()
        } Then {
            statusCode(200)

            val response = extract().body().`as`(QuizDetailsResponse::class.java)
            assertEquals(existing.id, response.quizId)
            assertEquals(existing.questions.size, response.questions.size)
            assertEquals(existing.questions.first().content, response.questions.first().content)
            assertEquals(existing.questions.first().answers.size, response.questions.first().answers.size)
            assertEquals(existing.questions.first().answers.first().content, response.questions.first().answers.first().content)
        }
    }

    @Test
    fun `should not create a quiz when no correct answer is provided`() {
        val request = getCreateQuizRequestWithoutCorrectAnswer()

        Given {
            header(getAuthHeader(userJwt))
            body(request)
        } When {
            post("/quizzes")
                .prettyPeek()
        } Then {
            statusCode(400)
        }
    }

    private fun getCreateQuizRequest(): CreateQuizRequest {
        return CreateQuizRequest(
            "test_quiz",
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

    private fun getCreateQuizRequestWithoutCorrectAnswer(): CreateQuizRequest {
        return CreateQuizRequest(
            "test_quiz",
            "Check your knowledge on Polish twitch.tv streamers",
            questions = listOf(
                QuizQuestion(
                    "What is the first name of a confident streamer under the nickname of mamm0n?",
                    listOf(
                        QuizAnswer("Adam", false),
                        QuizAnswer("Tomasz", false),
                        QuizAnswer("Jan", false),
                        QuizAnswer("Witold", false)
                    )
                ),
                QuizQuestion(
                    "Which streamer appears on the 'kac' emote?",
                    listOf(
                        QuizAnswer("mamm0n", false),
                        QuizAnswer("Gucio", false),
                        QuizAnswer("Demonzz", true),
                        QuizAnswer("Adamczyk", false)
                    )
                )
            )
        )
    }
}