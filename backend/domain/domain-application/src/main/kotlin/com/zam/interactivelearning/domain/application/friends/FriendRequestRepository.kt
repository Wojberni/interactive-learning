package com.zam.interactivelearning.domain.application.friends

import org.springframework.data.jpa.repository.JpaRepository
import java.util.*

interface FriendRequestRepository: JpaRepository<FriendRequestEntity, Long> {
    fun findBySenderIdAndReceiverId(senderId: Long, receiverId: Long): Optional<FriendRequestEntity>
}