package com.zam.interactivelearning.infrastructure.application.delivery.quiz.validator

import com.zam.interactivelearning.infrastructure.api.delivery.common.RequestValidationException
import com.zam.interactivelearning.infrastructure.api.delivery.common.RequestValidator
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.CreateQuizRequest
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizQuestion

class CreateQuizRequestValidator: RequestValidator<CreateQuizRequest> {
    override fun validate(request: CreateQuizRequest) {
        val isAnswersValid = request.questions.all { hasAtLeastOneCorrectAnswer(it) }
        if (!isAnswersValid) {
            throw RequestValidationException("At least one answer must be correct")
        }
    }

    private fun hasAtLeastOneCorrectAnswer(question: QuizQuestion): Boolean {
        return question.answers.any { it.isCorrect }
    }
}