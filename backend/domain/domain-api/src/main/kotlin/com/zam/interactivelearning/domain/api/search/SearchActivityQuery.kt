package com.zam.interactivelearning.domain.api.search

import com.zam.interactivelearning.cqrs.Query

data class SearchActivityQuery(
    val query: String
): Query<List<SearchActivityResult>>