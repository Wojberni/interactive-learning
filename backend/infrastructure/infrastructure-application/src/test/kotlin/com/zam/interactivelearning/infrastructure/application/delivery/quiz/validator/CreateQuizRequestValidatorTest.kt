package com.zam.interactivelearning.infrastructure.application.delivery.quiz.validator

import com.zam.interactivelearning.infrastructure.api.delivery.common.RequestValidationException
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.CreateQuizRequest
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizAnswer
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizQuestion
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test

class CreateQuizRequestValidatorTest {

        private var validator: CreateQuizRequestValidator = CreateQuizRequestValidator()

        @BeforeEach
        fun setUp() {
            validator = CreateQuizRequestValidator()
        }

        @Test
        fun `should throw exception when no correct answer is provided`() {
            val request = CreateQuizRequest(
                "Test",
                "Test",
                listOf(
                    QuizQuestion(
                        "Question 1",
                        listOf(
                            QuizAnswer("Answer 1", false),
                            QuizAnswer("Answer 2", false),
                            QuizAnswer("Answer 3", false)
                        )
                    )
                )
            )
            assertThrows(RequestValidationException::class.java) {
                validator.validate(request)
            }
        }

        @Test
        fun `should not throw exception when at least one correct answer is provided`() {
            val request = CreateQuizRequest(
                "Test",
                "Test",
                listOf(
                    QuizQuestion(
                        "Question 1",
                        listOf(
                            QuizAnswer("Answer 1", false),
                            QuizAnswer("Answer 2", false),
                            QuizAnswer("Answer 3", true)
                        )
                    )
                )
            )
            assertDoesNotThrow {
                validator.validate(request)
            }
        }
}