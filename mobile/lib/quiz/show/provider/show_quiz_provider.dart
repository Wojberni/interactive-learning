import 'package:flutter/material.dart';

import '../model/question_dto.dart';
import '../model/quiz_dto.dart';

enum QuizShowStatus { question, answer, result }

class ShowQuizProvider with ChangeNotifier {

  late QuizDto quiz;
  late QuestionDto question;

  int currentQuestion = 0;
  int rightAnswered = 0;
  QuizShowStatus status = QuizShowStatus.question;
  bool userCorrectAnswered = false;
  double userScore = 0;

  void nextQuestion(){
    currentQuestion += 1;
    if (currentQuestion < quiz.questions.length) {
      question = quiz.questions[currentQuestion];
      status = QuizShowStatus.question;
    } else {
      status = QuizShowStatus.result;
      userScore = rightAnswered / quiz.questions.length * 100;
    }
    notifyListeners();
  }

  void showAnswers(int containerIndex){
    if(question.answers[containerIndex].isCorrect){
      userCorrectAnswered = true;
      rightAnswered += 1;
    }
    else{
      userCorrectAnswered = false;
    }
    status = QuizShowStatus.answer;
    notifyListeners();
  }

}