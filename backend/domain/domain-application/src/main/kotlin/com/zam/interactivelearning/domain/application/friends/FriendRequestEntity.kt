package com.zam.interactivelearning.domain.application.friends

import com.zam.interactivelearning.domain.api.friends.FriendRequestStatus
import java.time.LocalDateTime
import javax.persistence.*

@Entity
class FriendRequestEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "friend_requests_id_seq")
    @SequenceGenerator(name = "friend_requests_id_seq", sequenceName = "friend_requests_id_seq", allocationSize = 1)
    val id: Long = 0,
    val senderId: Long = 0,
    val receiverId: Long = 0,
    @Enumerated(EnumType.STRING)
    val status: FriendRequestStatus = FriendRequestStatus.PENDING,
    val createdAt: LocalDateTime = LocalDateTime.now()
)