package com.zam.interactivelearning.domain.application.quiz

import org.springframework.data.repository.CrudRepository

interface QuizScoreRepository: CrudRepository<QuizScoreEntity, Long>