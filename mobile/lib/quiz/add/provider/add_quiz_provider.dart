import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/common/helpers/snackbar.dart';
import 'package:mobile/quiz/add/model/quiz_model.dart';

import '../model/answer_model.dart';
import '../model/question_model.dart';

class AddQuizProvider with ChangeNotifier {
  QuizModel quiz = QuizModel();
  bool addQuestions = false;
  int correctAnswer = 0;

  void addQuizTitleAndDescription(BuildContext context, String name, String description) {
    quiz.setName(name);
    quiz.setDescription(description);
    addQuestions = true;
    showSnackBar(context, 'Dodano tytuł oraz opis!', SnackBarType.success);
    notifyListeners();
  }

  void addQuestion(BuildContext context, String content, List<String> answers) {
    if(correctAnswer == 0) {
      showSnackBar(context, 'Podaj poprawną odpowiedź!', SnackBarType.error);
      return;
    }
    List<AnswerModel> answerModels = [];
    for (int i = 0; i < answers.length; i++) {
      answerModels
          .add(AnswerModel(content: answers[i], isCorrect: i+1 == correctAnswer));
    }
    quiz.questions.add(QuestionModel(content: content, answers: answerModels));
    showSnackBar(context, 'Dodano pytanie oraz odpowiedzi!', SnackBarType.success);
    notifyListeners();
  }

  void addQuiz(BuildContext context) {
    Map<String, dynamic> quizJson = quiz.toJson();
    CreateQuizRequest? request = CreateQuizRequest.fromJson(quizJson);
    if (request == null) {
      return;
    }
    QuizEndpointApi(apiClient)
        .createQuiz(request)
        .then((value) => {
              showSnackBar(context, "Dodano quiz!", SnackBarType.success),
              context.go('/'),
            })
        .catchError((error) => {
              showSnackBar(context, "Błąd serwera!", SnackBarType.error),
            });
    notifyListeners();
  }

  void setAnswerNr(int correctAnswer) {
    this.correctAnswer = correctAnswer;
    notifyListeners();
  }
}
