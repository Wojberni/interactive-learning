package com.zam.interactivelearning.domain.api.friends

import com.zam.interactivelearning.cqrs.Command

data class RemoveFriendCommand(
    val userId: Long,
    val friendId: Long
): Command<Unit>
