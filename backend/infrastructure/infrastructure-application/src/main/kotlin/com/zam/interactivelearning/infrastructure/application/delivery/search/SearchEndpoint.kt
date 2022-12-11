package com.zam.interactivelearning.infrastructure.application.delivery.search

import com.zam.interactivelearning.infrastructure.api.delivery.search.SearchResponse
import com.zam.interactivelearning.infrastructure.application.delivery.search.helper.SearchEndpointHelper
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/search")
class SearchEndpoint(
    private val helper: SearchEndpointHelper
) {

    @GetMapping
    fun search(@RequestParam query: String): SearchResponse {
        return helper.search(query)
    }
}