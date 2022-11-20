package com.zam.interactivelearning.domain.application.friends

import com.zam.interactivelearning.domain.api.friends.FriendRequestStatus
import java.time.LocalDateTime
import javax.persistence.*

@Entity
@Table(name = "FRIEND_REQUESTS")
class FriendRequestEntity(
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "friend_requests_id_seq")
    @SequenceGenerator(name = "friend_requests_id_seq", sequenceName = "friend_requests_id_seq", allocationSize = 1)
    var id: Long = 0,
    var senderId: Long = 0,
    var receiverId: Long = 0,
    @Enumerated(EnumType.STRING)
    var status: FriendRequestStatus = FriendRequestStatus.PENDING,
    var createdAt: LocalDateTime = LocalDateTime.now()
)