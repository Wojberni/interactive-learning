package com.zam.interactivelearning.infrastructure.application.delivery.quiz

import com.zam.interactivelearning.infrastructure.api.delivery.common.DefaultResponse
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.CreateQuizRequest
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizDetailsResponse
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.QuizListResponse
import com.zam.interactivelearning.infrastructure.api.delivery.quiz.ReportQuizScoreRequest
import com.zam.interactivelearning.infrastructure.application.delivery.quiz.helper.QuizEndpointHelper
import com.zam.interactivelearning.security.api.AuthenticatedUser
import io.swagger.v3.oas.annotations.Operation
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestController
import javax.validation.Valid

@RestController
@RequestMapping("/quizzes")
@AuthenticatedUser
class QuizEndpoint(
    val helper: QuizEndpointHelper
) {

    @PostMapping()
    @ResponseStatus(HttpStatus.CREATED)
    @Operation(summary = "Create a new quiz")
    fun createQuiz(@RequestBody @Valid createQuizRequest: CreateQuizRequest): DefaultResponse {
        helper.createQuiz(createQuizRequest)
        return DefaultResponse()
    }

    @GetMapping()
    @Operation(summary = "Get all quizzes", description = "Returns a list of all quizzes for presentation purposes (the quizzes do not include questions)")
    fun getAllQuizzes(): QuizListResponse {
        return helper.getAllQuizzes()
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get a quiz by id", description = "Returns a quiz with all questions and answers")
    fun getQuizById(@PathVariable id: Long): QuizDetailsResponse {
        return helper.getQuizById(id)
    }

    @GetMapping("/daily-challenge")
    @Operation(summary = "Get the daily challenge", description = "Returns the daily challenge quiz with all questions and answers")
    fun getDailyChallenge(): QuizDetailsResponse {
        return helper.getDailyChallenge()
    }

    @PostMapping("/report-score")
    @ResponseStatus(HttpStatus.CREATED)
    @Operation(summary = "Report quiz score", description = "Reports the score for a quiz so that it is persisted")
    fun reportQuizScore(@RequestBody @Valid reportQuizScoreRequest: ReportQuizScoreRequest): DefaultResponse {
        helper.reportQuizScore(reportQuizScoreRequest)
        return DefaultResponse()
    }

    @GetMapping("/random")
    @Operation(summary = "Get a random quiz", description = "Returns a random quiz with all questions and answers")
    fun getRandomQuiz(): QuizDetailsResponse {
        return helper.getRandomQuiz()
    }
}