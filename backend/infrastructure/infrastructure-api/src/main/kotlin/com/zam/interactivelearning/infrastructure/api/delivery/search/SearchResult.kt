package com.zam.interactivelearning.infrastructure.api.delivery.search

import javax.validation.constraints.NotNull

data class SearchResult(
    @get: NotNull
    val id: Long,
    @get: NotNull
    val title: String,
    @get: NotNull
    val description: String,
    @get: NotNull
    val author: String,
    @get: NotNull
    val successRate: Int,
    @get: NotNull
    val kind: ActivityKind,
)