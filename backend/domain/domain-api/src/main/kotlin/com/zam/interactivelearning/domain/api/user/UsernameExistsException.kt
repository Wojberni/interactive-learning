package com.zam.interactivelearning.domain.api.user

import com.zam.interactivelearning.domain.api.common.DomainException

class UsernameExistsException(
    override val message: String
): DomainException(message)