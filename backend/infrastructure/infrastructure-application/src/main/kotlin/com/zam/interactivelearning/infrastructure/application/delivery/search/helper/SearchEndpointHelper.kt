package com.zam.interactivelearning.infrastructure.application.delivery.search.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.search.SearchActivityQuery
import com.zam.interactivelearning.domain.api.user.GetUsernameByIdQuery
import com.zam.interactivelearning.infrastructure.api.delivery.search.ActivityKind
import com.zam.interactivelearning.infrastructure.api.delivery.search.SearchResponse
import com.zam.interactivelearning.infrastructure.api.delivery.search.SearchResult

class SearchEndpointHelper(
    private val executor: CqrsExecutor
) {

    fun search(query: String): SearchResponse {
        val results = executor.executeQuery(SearchActivityQuery(query))
        return SearchResponse(
            results.map {
                SearchResult(
                    id = it.id,
                    title = it.title,
                    description = it.description,
                    author = executor.executeQuery(GetUsernameByIdQuery(it.authorId)),
                    successRate = it.successRate,
                    kind = ActivityKind.valueOf(it.kind.name)
                )
            }
        )
    }
}