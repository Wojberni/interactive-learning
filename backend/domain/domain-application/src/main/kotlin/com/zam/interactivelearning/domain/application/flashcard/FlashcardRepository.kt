package com.zam.interactivelearning.domain.application.flashcard

import org.springframework.data.jpa.repository.JpaRepository

interface FlashcardRepository: JpaRepository<FlashCardEntity, Long> {
    fun findAllByContentContainsIgnoreCase(content: String): List<FlashCardEntity>
}