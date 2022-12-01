package com.zam.interactivelearning.application.test.user

import com.zam.interactivelearning.application.AuthenticatedTest
import com.zam.interactivelearning.application.IntegrationTest
import com.zam.interactivelearning.domain.application.quiz.QuizRepository
import com.zam.interactivelearning.domain.application.quiz.QuizScoreEntity
import com.zam.interactivelearning.domain.application.user.persistence.UserEntity
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import io.restassured.module.mockmvc.RestAssuredMockMvc
import io.restassured.module.mockmvc.kotlin.extensions.Given
import io.restassured.module.mockmvc.kotlin.extensions.Then
import io.restassured.module.mockmvc.kotlin.extensions.When
import org.hamcrest.Matchers.equalTo
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.context.WebApplicationContext

@IntegrationTest
class UserEndpointTest(
    @Autowired
    val webApplicationContext: WebApplicationContext,
    @Autowired
    val userRepository: UserRepository,
    @Autowired
    val quizRepository: QuizRepository
) : AuthenticatedTest() {

    @BeforeEach
    fun setup() {
        RestAssuredMockMvc.webAppContextSetup(webApplicationContext)
    }

    @Test
    @Transactional
    fun `should get the currently logged in user profile`() {
        val defaultQuiz = quizRepository.findAll().first()
        defaultUser.friends = mutableSetOf(prepareUser())
        defaultUser.dailyStreak = 3
        defaultUser.quizScores = listOf(
            QuizScoreEntity(
                quiz = defaultQuiz,
                user = defaultUser,
                score = 1
            )
        )
        userRepository.save(defaultUser)

        Given {
            header(getAuthHeader(userJwt))
        } When {
            get("/users/profile/me")
        } Then {
            statusCode(200)

            body("username", equalTo("test_user"))
            body("email", equalTo("test@test.com"))
            body("finishedActivitiesCount", equalTo(1))
            body("friendsCount", equalTo(1))
            body("dailyStreak", equalTo(3))
        }
    }

    private fun prepareUser(): UserEntity {
        return userRepository.save(
            UserEntity(
                username = "friend"
            )
        )
    }
}