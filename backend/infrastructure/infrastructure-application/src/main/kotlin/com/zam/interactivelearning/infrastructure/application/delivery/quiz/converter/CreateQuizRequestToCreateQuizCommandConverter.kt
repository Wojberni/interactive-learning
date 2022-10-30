package com.zam.interactivelearning.infrastructure.application.delivery.quiz.converter

import com.zam.interactivelearning.domain.api.quiz.Answer
import com.zam.interactivelearning.domain.api.quiz.CreateQuizCommand
import com.zam.interactivelearning.domain.api.quiz.Question
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.CreateQuizRequest

fun CreateQuizRequest.toCommand(): CreateQuizCommand {
    return CreateQuizCommand(
        name = this.name,
        description = this.description,
        questions = this.questions.map { question ->
            Question(
                content = question.content,
                answers = question.answers.map { answer ->
                    Answer(
                        content = answer.content,
                        isCorrect = answer.isCorrect
                    )
                }
            )
        }
    )
}