package com.zam.interactivelearning.domain.application.quiz

import com.zam.interactivelearning.cqrs.CommandHandler
import com.zam.interactivelearning.domain.api.quiz.Answer
import com.zam.interactivelearning.domain.api.quiz.CreateQuizCommand
import com.zam.interactivelearning.domain.api.quiz.Question
import com.zam.interactivelearning.security.api.UserContextHolder
import kotlin.reflect.KClass

class CreateQuizCommandHandler(
    private val quizRepository: QuizRepository,
    private val userContextHolder: UserContextHolder
): CommandHandler<CreateQuizCommand, Unit> {

    override fun handle(command: CreateQuizCommand) {
        quizRepository.save(command.toQuizEntity())
    }

    override fun supportedClass(): KClass<CreateQuizCommand> {
        return CreateQuizCommand::class
    }

    private fun CreateQuizCommand.toQuizEntity(): QuizEntity {
        val quizEntity = QuizEntity(
            name = this.name,
            description = this.description,
            createdBy = userContextHolder.getCurrentUser().id
        )
        this.questions.forEach { question ->
            quizEntity.questions.add(question.toEntity(quizEntity))
        }

        return quizEntity
    }

    private fun Question.toEntity(quizEntity: QuizEntity): QuestionEntity {
        val questionEntity = QuestionEntity(
            content = this.content,
            quiz = quizEntity,
            createdBy = userContextHolder.getCurrentUser().id
        )
        this.answers.forEach { answer ->
            questionEntity.answers.add(answer.toEntity(questionEntity))
        }
        return questionEntity
    }

    private fun Answer.toEntity(questionEntity: QuestionEntity): AnswerEntity {
        return AnswerEntity(
            content = this.content,
            question = questionEntity,
            isCorrect = this.isCorrect,
            createdBy = userContextHolder.getCurrentUser().id
        )
    }
}