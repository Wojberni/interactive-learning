package com.zam.interactivelearning.domain.application.quiz.converter

import com.zam.interactivelearning.domain.api.quiz.Answer
import com.zam.interactivelearning.domain.api.quiz.Question
import com.zam.interactivelearning.domain.api.quiz.Quiz
import com.zam.interactivelearning.domain.application.quiz.QuizEntity

fun QuizEntity.toQuiz(): Quiz {
    return Quiz(
        this.id,
        this.name,
        this.createdBy,
        this.description,
        this.questions.map {
            Question(
                it.content,
                it.answers.map {answer ->
                    Answer(
                        answer.content,
                        answer.isCorrect
                    )
                }
            )
        }
    )
}