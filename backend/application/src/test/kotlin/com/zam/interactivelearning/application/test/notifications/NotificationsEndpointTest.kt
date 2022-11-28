package com.zam.interactivelearning.application.test.notifications

import com.zam.interactivelearning.application.AuthenticatedTest
import com.zam.interactivelearning.application.IntegrationTest
import com.zam.interactivelearning.domain.application.friends.FriendRequestRepository
import com.zam.interactivelearning.domain.application.notifications.NotificationTargetEntity
import com.zam.interactivelearning.domain.application.notifications.NotificationTargetRepository
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import com.zam.interactivelearning.infrastructure.api.delivery.notifications.RegisterOrUpdateDeviceTokenRequest
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
@Transactional
class NotificationsEndpointTest(
    @Autowired
    val webApplicationContext: WebApplicationContext,
    @Autowired
    val notificationTargetRepository: NotificationTargetRepository,
    @Autowired
    val userRepository: UserRepository
) : AuthenticatedTest() {

    @BeforeEach
    fun setup() {
        RestAssuredMockMvc.webAppContextSetup(webApplicationContext)
    }

    @Test
    fun `should register a new device token`() {
        Given {
            header(getAuthHeader(userJwt))
            body(RegisterOrUpdateDeviceTokenRequest("token"))
        } When {
            post("/notifications/device-token")
        } Then {
            statusCode(200)

            val notificationTarget = notificationTargetRepository.findAll().first()
            assertEquals("token", notificationTarget.targetFirebaseToken)
            assertEquals(defaultUser.id, notificationTarget.user?.id)
        }
    }

    @Test
    fun `should update an existing token`() {
        defaultUser.notificationTarget = NotificationTargetEntity(
            user = defaultUser,
            targetFirebaseToken = "old_token"
        )
        userRepository.save(defaultUser)

        Given {
            header(getAuthHeader(userJwt))
            body(RegisterOrUpdateDeviceTokenRequest("token"))
        } When {
            post("/notifications/device-token")
        } Then {
            statusCode(200)

            val notificationTarget = notificationTargetRepository.findAll().first()
            assertEquals("token", notificationTarget.targetFirebaseToken)
            assertEquals(defaultUser.id, notificationTarget.user?.id)
        }
    }
}