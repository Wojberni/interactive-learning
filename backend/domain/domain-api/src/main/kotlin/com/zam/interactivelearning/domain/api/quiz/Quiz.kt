package com.zam.interactivelearning.domain.api.quiz

data class Quiz(
    val id: Long,
    val name: String,
    val description: String,
    val flashCardIds: List<Long>,
    val userId: Long
){
}