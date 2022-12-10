package com.zam.interactivelearning.domain.application.quiz

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query

interface QuizRepository: JpaRepository<QuizEntity, Long> {
    @Query(nativeQuery = true, value = "SELECT * FROM quiz ORDER BY RANDOM() LIMIT 1")
    fun getRandomQuiz(): QuizEntity
}