package com.zam.interactivelearning.application.test.friends

import com.zam.interactivelearning.application.AuthenticatedTest
import com.zam.interactivelearning.application.IntegrationTest
import com.zam.interactivelearning.domain.api.friends.FriendRequestStatus
import com.zam.interactivelearning.domain.application.friends.FriendRequestEntity
import com.zam.interactivelearning.domain.application.friends.FriendRequestRepository
import com.zam.interactivelearning.domain.application.user.persistence.UserEntity
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import com.zam.interactivelearning.infrastructure.api.delivery.friends.AddFriendRequest
import io.restassured.module.mockmvc.RestAssuredMockMvc
import io.restassured.module.mockmvc.kotlin.extensions.Given
import io.restassured.module.mockmvc.kotlin.extensions.Then
import io.restassured.module.mockmvc.kotlin.extensions.When
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Disabled
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.context.WebApplicationContext

@IntegrationTest
@Transactional
class FriendsEndpointTest(
    @Autowired
    val webApplicationContext: WebApplicationContext,
    @Autowired
    val friendRequestRepository: FriendRequestRepository,
    @Autowired
    val userRepository: UserRepository,
) : AuthenticatedTest() {

    lateinit var sender: UserEntity

    @BeforeEach
    fun setup() {
        RestAssuredMockMvc.webAppContextSetup(webApplicationContext)
        sender = userRepository.findByUsername("test_user").orElseThrow()
    }

    @Test
    fun `should create a friend request`() {
        val targetUser = prepareTargetUser()

        Given {
            header(getAuthHeader(userJwt))
            body(AddFriendRequest(targetUser.username))
        } When {
            post("/friends/add")
        } Then {
            statusCode(201)

            val created = friendRequestRepository.findAll().first()
            assertEquals(sender.id, created.senderId)
            assertEquals(targetUser.id, created.receiverId)
            assertEquals(FriendRequestStatus.PENDING, created.status)
        }
    }

    @Test
    fun `should not create a friend request when there is one already pending`() {
        val targetUser = prepareTargetUser()
        saveFriendRequest(sender, targetUser, FriendRequestStatus.PENDING)

        Given {
            header(getAuthHeader(userJwt))
            body(AddFriendRequest(targetUser.username))
        } When {
            post("/friends/add")
                .prettyPeek()
        } Then {
            statusCode(400)
        }
    }

    @Test
    fun `should not create a friend request when the target user has sent you a request`() {
        val targetUser = prepareTargetUser()
        saveFriendRequest(sender, targetUser, FriendRequestStatus.PENDING)

        Given {
            header(getAuthHeader(userJwt))
            body(AddFriendRequest(targetUser.username))
        } When {
            post("/friends/add")
                .prettyPeek()
        } Then {
            statusCode(400)
        }
    }

    @Test
    @Disabled("TODO: enable when the friendship is implemented")
    fun `should not create a friend request when there is one already accepted`() {
        val targetUser = prepareTargetUser()
        saveFriendRequest(sender, targetUser, FriendRequestStatus.ACCEPTED)

        Given {
            header(getAuthHeader(userJwt))
            body(AddFriendRequest(targetUser.username))
        } When {
            post("/friends/add")
                .prettyPeek()
        } Then {
            statusCode(400)
        }
    }


    private fun saveFriendRequest(
        sender: UserEntity,
        targetUser: UserEntity,
        status: FriendRequestStatus
    ): FriendRequestEntity {
        return friendRequestRepository.save(
            FriendRequestEntity(
                senderId = sender.id,
                receiverId = targetUser.id,
                status = status
            )
        )
    }

    private fun prepareTargetUser(): UserEntity {
        return userRepository.save(
            UserEntity(
                username = "target"
            )
        )
    }
}