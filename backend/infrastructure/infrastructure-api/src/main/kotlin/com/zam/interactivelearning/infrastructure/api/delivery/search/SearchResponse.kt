package com.zam.interactivelearning.infrastructure.api.delivery.search

import javax.validation.constraints.NotNull

data class SearchResponse(
    @NotNull
    val results: List<SearchResult>
)

