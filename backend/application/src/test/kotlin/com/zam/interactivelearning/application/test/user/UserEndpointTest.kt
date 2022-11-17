package com.zam.interactivelearning.application.test.user

import com.zam.interactivelearning.application.AuthenticatedTest
import com.zam.interactivelearning.application.IntegrationTest
import io.restassured.module.mockmvc.RestAssuredMockMvc
import io.restassured.module.mockmvc.kotlin.extensions.Given
import io.restassured.module.mockmvc.kotlin.extensions.Then
import io.restassured.module.mockmvc.kotlin.extensions.When
import org.hamcrest.Matchers.equalTo
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.context.WebApplicationContext

@IntegrationTest
class UserEndpointTest(
    @Autowired
    val webApplicationContext: WebApplicationContext
) : AuthenticatedTest() {

    @BeforeEach
    fun setup() {
        RestAssuredMockMvc.webAppContextSetup(webApplicationContext)
    }

    @Test
    fun `should get the currently logged in user profile`() {
        Given {
            header(getAuthHeader(userJwt))
        } When {
            get("/users/profile/me")
        } Then {
            statusCode(200)

            body("username", equalTo("test_user"))
            body("email", equalTo("test@test.com"))
            body("finishedActivitiesCount", equalTo(0))
            body("friendsCount", equalTo(0))
            body("dailyStreak", equalTo(0))
        }
    }

}