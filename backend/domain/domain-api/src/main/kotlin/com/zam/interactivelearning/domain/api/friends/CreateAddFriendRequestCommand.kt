package com.zam.interactivelearning.domain.api.friends

import com.zam.interactivelearning.cqrs.Command

data class CreateAddFriendRequestCommand(
    val targetUsername: String
): Command<Unit>