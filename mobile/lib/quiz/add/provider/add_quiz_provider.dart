import 'package:flutter/material.dart';
import 'package:mobile/quiz/add/model/quiz.dart';

import '../model/answer.dart';
import '../model/question.dart';

class AddQuizProvider with ChangeNotifier {

  late Quiz quiz;

  void addQuizTitleAndDescription(String name, String description){
    quiz.name = name;
    quiz.description = description;
    notifyListeners();
  }

  void addQuestion(String content, List<Answer> answers){
    quiz.questions.add(Question(content: content, answers: answers));
    notifyListeners();
  }

}