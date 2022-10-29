package com.zam.interactivelearning.domain.application.quiz

import org.springframework.data.jpa.repository.JpaRepository

interface QuizRepository: JpaRepository<QuizEntity, Long> {
}