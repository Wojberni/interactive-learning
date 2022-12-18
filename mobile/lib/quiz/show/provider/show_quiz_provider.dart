import 'package:flutter/material.dart';
import 'package:mobile/quiz/show/model/user_quiz_data.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:learning_api/api.dart';

import '../model/question_dto.dart';
import '../model/quiz_dto.dart';

enum QuizShowStatus { question, answer, result }

class ShowQuizProvider with ChangeNotifier {
  late QuizDto quiz;
  late QuestionDto question;

  UserQuizData userQuizData = UserQuizData();

  void nextQuestion() {
    userQuizData.currentQuestion += 1;
    if (userQuizData.currentQuestion < quiz.questions.length) {
      question = quiz.questions[userQuizData.currentQuestion];
      userQuizData.status = QuizShowStatus.question;
    } else {
      userQuizData.userScore =
          userQuizData.rightAnsweredCount / quiz.questions.length * 100;
      userQuizData.status = QuizShowStatus.result;
    }
    notifyListeners();
  }

  void showAnswers(int containerIndex) {
    userQuizData.currentAnswer = containerIndex;
    userQuizData.correctAnswer =
        question.answers.indexWhere((element) => element.isCorrect);
    if (userQuizData.currentAnswer == userQuizData.correctAnswer) {
      userQuizData.userCorrectAnswered = true;
      userQuizData.rightAnsweredCount += 1;
    } else {
      userQuizData.userCorrectAnswered = false;
    }
    userQuizData.status = QuizShowStatus.answer;
    notifyListeners();
  }

  Future<String> sendResult() async {
    DefaultResponse? response = await QuizEndpointApi(apiClient)
        .reportQuizScore(ReportQuizScoreRequest(
        quizId: quiz.quizId, correctAnswersCount: userQuizData.rightAnsweredCount));
    return response.toString();
  }
}
