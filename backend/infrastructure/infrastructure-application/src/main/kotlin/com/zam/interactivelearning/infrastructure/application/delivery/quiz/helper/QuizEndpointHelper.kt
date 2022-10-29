package com.zam.interactivelearning.infrastructure.application.delivery.quiz.helper

import com.zam.interactivelearning.cqrs.CqrsExecutor
import com.zam.interactivelearning.domain.api.quiz.Answer
import com.zam.interactivelearning.domain.api.quiz.CreateQuizCommand
import com.zam.interactivelearning.domain.api.quiz.Question
import com.zam.interactivelearning.domain.api.quiz.Quiz
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.CreateQuizRequest

class QuizEndpointHelper(
    private val executor: CqrsExecutor,
) {
    fun createQuiz(createQuizRequest: CreateQuizRequest) {
        executor.executeCommand(createQuizRequest.toCommand())
    }

    private fun CreateQuizRequest.toCommand(): CreateQuizCommand {
        return CreateQuizCommand(
            quiz = Quiz(
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
        )
    }
}