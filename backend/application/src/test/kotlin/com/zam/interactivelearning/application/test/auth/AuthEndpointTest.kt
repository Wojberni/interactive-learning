package com.zam.interactivelearning.application.test.auth

import com.zam.interactivelearning.application.IntegrationTest
import com.zam.interactivelearning.domain.application.user.UserEntity
import com.zam.interactivelearning.domain.application.user.UserRepository
import com.zam.interactivelearning.infrastructure.api.delivery.auth.LoginUserRequest
import com.zam.interactivelearning.infrastructure.api.delivery.auth.RegisterUserRequest
import io.restassured.module.mockmvc.RestAssuredMockMvc
import io.restassured.module.mockmvc.kotlin.extensions.Given
import io.restassured.module.mockmvc.kotlin.extensions.Then
import io.restassured.module.mockmvc.kotlin.extensions.When
import org.hamcrest.Matchers
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.web.context.WebApplicationContext

@IntegrationTest
class AuthEndpointTest(
    @Autowired
    val webApplicationContext: WebApplicationContext,
    @Autowired
    val userRepository: UserRepository,
    @Autowired
    val passwordEncoder: PasswordEncoder
) {

    @BeforeEach
    fun setup() {
        RestAssuredMockMvc.webAppContextSetup(webApplicationContext)
    }

    @Test
    fun `should register a new user`() {
        Given {
            body(RegisterUserRequest("foo@bar.com","foo", "bar"))
        } When {
            post ("/auth/register")
        } Then {
            statusCode(201)

            assertTrue(userRepository.existsByUsername("foo"))
        }
    }

    @Test
    fun `should not register a new user when username is taken`() {
        userRepository.save(UserEntity(username = "foo", password =  "asdf", roles = setOf()))

        Given {
            body(RegisterUserRequest("foo@bar.com","foo", "qwerty"))
        } When {
            post("auth/register")
        } Then {
            statusCode(400)
            body("status", Matchers.equalTo(400),
                "message", Matchers.equalTo("User with username foo already exists")
            )
        }
    }

    @Test
    fun `should log the user in using valid credentials`() {
        userRepository.save(
            UserEntity(username = "test", password = passwordEncoder.encode("password"), roles = setOf())
        )

        Given {
            body(LoginUserRequest("test", "password"))
        } When {
            post("/auth/login")
        } Then {
            statusCode(200)
            body("token", Matchers.`is`(Matchers.notNullValue()))
        }
    }

    @Test
    fun `should not log the user in using invalid credentials`() {
        Given {
            body(LoginUserRequest("foo", "bar"))
        } When {
            post("/auth/login")
        } Then {
            statusCode(403)
        }
    }

}