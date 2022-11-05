package com.zam.interactivelearning.domain.application.flashcard

import org.springframework.data.jpa.repository.JpaRepository

interface FlashcardRepository: JpaRepository<FlashcardEntity, Long>