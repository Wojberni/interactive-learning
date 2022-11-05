package com.zam.interactivelearning.domain.api.flashcard

class Flashcard(
    val id: Long,
    val content: String,
    val answer: String,
    val createdBy: Long
)