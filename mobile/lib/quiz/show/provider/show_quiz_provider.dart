import 'package:flutter/material.dart';

import '../model/question_dto.dart';
import '../model/quiz_dto.dart';

class ShowQuizProvider with ChangeNotifier {

  late QuizDto quiz;
  late QuestionDto question;

  bool showAnswer = false;
  int currentQuestion = 0;

  void nextQuestion(){
    currentQuestion += 1;
    question = quiz.questions[currentQuestion];
    notifyListeners();
  }

  void showAnswers(int containerIndex){
    showAnswer = true;
    if(question.answers[containerIndex].isCorrect){
      print('Correct');
    }
    else{
      print('Incorrect');
    }
    // notifyListeners();
  }

}