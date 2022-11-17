package com.zam.interactivelearning.domain.api.user

import com.zam.interactivelearning.domain.api.common.DomainException

class EmailExistsException(
    override val message: String
): DomainException(message)