package com.zam.interactivelearning.application.test.serach

import com.zam.interactivelearning.application.AuthenticatedTest
import com.zam.interactivelearning.application.IntegrationTest
import com.zam.interactivelearning.infrastructure.api.delivery.search.ActivityKind
import com.zam.interactivelearning.infrastructure.api.delivery.search.SearchResponse
import io.restassured.module.mockmvc.RestAssuredMockMvc
import io.restassured.module.mockmvc.kotlin.extensions.Given
import io.restassured.module.mockmvc.kotlin.extensions.Then
import io.restassured.module.mockmvc.kotlin.extensions.When
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.context.WebApplicationContext

@IntegrationTest
class SearchEndpointTest(
    @Autowired
    val webApplicationContext: WebApplicationContext,
) : AuthenticatedTest() {

    @BeforeEach
    fun setup() {
        RestAssuredMockMvc.webAppContextSetup(webApplicationContext)
    }

    @Test
    fun `should return the correct search results`() {
        Given {
            header(getAuthHeader(userJwt))
            queryParam("query", "monarchs")
        } When {
            get("/search")
        } Then {
            statusCode(200)

            val response = extract().body().`as`(SearchResponse::class.java)
            assertEquals(2, response.results.size)
            assertEquals("Polish monarchs", response.results[0].title)
            assertEquals(ActivityKind.QUIZ, response.results[0].kind)
            assertEquals("aha Polish Monarchs oho", response.results[1].title)
            assertEquals(ActivityKind.FLASHCARD, response.results[1].kind)
        }

    }

}