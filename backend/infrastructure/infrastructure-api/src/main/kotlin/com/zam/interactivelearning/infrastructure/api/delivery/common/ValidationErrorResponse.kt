package com.zam.interactivelearning.infrastructure.api.delivery.common

import java.time.LocalDateTime
import javax.validation.constraints.NotNull

class ValidationErrorResponse(
    @NotNull
    val timestamp: LocalDateTime,
    @NotNull
    val status: Int,
    @NotNull
    val errors: Map<String /* field name */, String /* error message */>
)