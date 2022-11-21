package com.zam.interactivelearning.application.test.friends

import com.zam.interactivelearning.application.AuthenticatedTest
import com.zam.interactivelearning.application.IntegrationTest
import com.zam.interactivelearning.domain.api.friends.FriendRequestStatus
import com.zam.interactivelearning.domain.application.friends.FriendRequestEntity
import com.zam.interactivelearning.domain.application.friends.FriendRequestRepository
import com.zam.interactivelearning.domain.application.user.persistence.UserEntity
import com.zam.interactivelearning.domain.application.user.persistence.UserRepository
import com.zam.interactivelearning.infrastructure.api.delivery.friends.*
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizDetailsResponse
import io.restassured.module.mockmvc.RestAssuredMockMvc
import io.restassured.module.mockmvc.kotlin.extensions.Given
import io.restassured.module.mockmvc.kotlin.extensions.Then
import io.restassured.module.mockmvc.kotlin.extensions.When
import org.hamcrest.Matchers.equalTo
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

    @BeforeEach
    fun setup() {
        RestAssuredMockMvc.webAppContextSetup(webApplicationContext)
         /*this repeated assignment is needed due to accessing the lazy initialized collection,
         there is probably a better way to do this :( */
        defaultUser = userRepository.findByUsername("test_user").orElseThrow()
    }

    @Test
    fun `should create a friend request`() {
        val targetUser = prepareUser()

        Given {
            header(getAuthHeader(userJwt))
            body(AddFriendRequest(targetUser.username))
        } When {
            post("/friends/add")
        } Then {
            statusCode(201)

            val created = friendRequestRepository.findAll().first()
            assertEquals(defaultUser.id, created.senderId)
            assertEquals(targetUser.id, created.receiverId)
            assertEquals(FriendRequestStatus.PENDING, created.status)
        }
    }

    @Test
    fun `should not create a friend request when there is one already pending`() {
        val targetUser = prepareUser()
        saveFriendRequest(defaultUser, targetUser, FriendRequestStatus.PENDING)

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
        val targetUser = prepareUser()
        saveFriendRequest(defaultUser, targetUser, FriendRequestStatus.PENDING)

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
    fun `should return pending friend requests`() {
        val firstSender = prepareUser()
        val secondSender = prepareUser()
        saveFriendRequest(firstSender, defaultUser, FriendRequestStatus.PENDING)
        saveFriendRequest(secondSender, defaultUser, FriendRequestStatus.ACCEPTED)
        saveFriendRequest(secondSender, firstSender, FriendRequestStatus.PENDING)

        Given {
            header(getAuthHeader(userJwt))
        } When {
            get("/friends/requests/pending")
                .prettyPeek()
        } Then {
            statusCode(200)
            val response = extract().body().`as`(PendingFriendRequestsResponse::class.java)
            assertEquals(1, response.friendRequests.size)
            assertEquals(firstSender.username, response.friendRequests.first().senderUsername)
        }
    }

    @Test
    fun `should accept a friend request`() {
        val sender = prepareUser()
        val friendRequest = saveFriendRequest(sender, defaultUser, FriendRequestStatus.PENDING)

        Given {
            header(getAuthHeader(userJwt))
            body(AcceptOrRejectFriendRequest(friendRequest.id, AcceptOrRejectFriendRequestAction.ACCEPT))
        } When {
            post("/friends/requests/acceptOrReject")
                .prettyPeek()
        } Then {
            statusCode(200)
            val updated = friendRequestRepository.findById(friendRequest.id).orElseThrow()
            assertEquals(FriendRequestStatus.ACCEPTED, updated.status)

            assertEquals(1, defaultUser.friends.size)
            assertEquals(1, sender.friends.size)
            assertEquals(defaultUser.id, sender.friends.first().id)
            assertEquals(sender.id, defaultUser.friends.first().id)
        }
    }

    @Test
    fun `should get my friends`() {
        defaultUser.friends = mutableSetOf(prepareUser())
        userRepository.save(defaultUser)

        Given {
            header(getAuthHeader(userJwt))
        } When {
            get("/friends")
                .prettyPeek()
        } Then {
            statusCode(200)

            val response = extract().body().`as`(FriendsListResponse::class.java)
            assertEquals(1, response.friends.size)
            assertEquals("target", response.friends[0].username)
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

    private fun prepareUser(): UserEntity {
        return userRepository.save(
            UserEntity(
                username = "target"
            )
        )
    }
}