package com.zam.interactivelearning.domain.api.friends

import com.zam.interactivelearning.domain.api.common.DomainException

class FriendRequestPendingException(
    override val message: String
): DomainException(message)