package com.zam.interactivelearning.infrastructure.application.delivery.quiz.converter

import com.zam.interactivelearning.domain.api.quiz.Quiz
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizAnswer
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizDetailsResponse
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizQuestion

fun Quiz.toQuizDetailsResponse(): QuizDetailsResponse {
    return QuizDetailsResponse(
        quizId = this.id,
        questions = this.questions.map {
            QuizQuestion(
                it.content,
                it.answers.map { answer ->
                    QuizAnswer(
                        answer.content,
                        answer.isCorrect
                    )
                }
            )
        }
    )
}