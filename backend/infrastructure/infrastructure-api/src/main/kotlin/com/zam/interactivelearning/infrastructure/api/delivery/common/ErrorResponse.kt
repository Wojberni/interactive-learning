package com.zam.interactivelearning.infrastructure.api.delivery.common

import java.time.LocalDateTime
import javax.validation.constraints.NotNull

class ErrorResponse(
    @NotNull
    val timestamp: LocalDateTime,
    @NotNull
    val status: Int,
    @NotNull
    val message: String,
    @NotNull
    val errorCode: String = ""
)