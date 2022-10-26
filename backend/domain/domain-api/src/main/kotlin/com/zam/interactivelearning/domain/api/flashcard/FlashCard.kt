package com.zam.interactivelearning.domain.api.flashcard

data class FlashCard (
    val id: Long,
    val question: String,
    val answer: String,
    val tags: List<String>,
    val userId: Long){

}

