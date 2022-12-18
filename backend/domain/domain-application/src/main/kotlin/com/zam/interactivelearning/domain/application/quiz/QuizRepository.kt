package com.zam.interactivelearning.domain.application.quiz

import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query

interface QuizRepository: JpaRepository<QuizEntity, Long> {
    @Query(nativeQuery = true, value = "SELECT * FROM quizzes WHERE id not in (SELECT id FROM daily_challenge) ORDER BY RANDOM() LIMIT 1;")
    fun getNextDailyChallenge(): QuizEntity

    @Query(nativeQuery = true, value = "SELECT * FROM quizzes ORDER BY RANDOM() LIMIT 1;")
    fun getRandomQuiz(): QuizEntity

    fun findALlByNameContainsIgnoreCaseOrDescriptionContainsIgnoreCase(name: String, description: String): List<QuizEntity>
}