import 'package:mobile/quiz/add/model/question_model.dart';

class QuizModel {
  String name = "";
  String description = "";
  List<QuestionModel> questions = [];

  Map<String, Object?> toJson() => {
        'name': name,
        'description': description,
        'questions': questions.map((e) => e.toJson()).toList(),
      };

  void setName(String name) {
    this.name = name;
  }

  void setDescription(String description) {
    this.description = description;
  }

  void setQuestions(List<QuestionModel> questions) {
    this.questions = questions;
  }

  get getName => name;

  get getDescription => description;
}
