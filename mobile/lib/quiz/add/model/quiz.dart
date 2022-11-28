import 'package:mobile/quiz/add/model/question.dart';

class Quiz{

  final String name;
  final String description;
  final List<Question> questions;

  const Quiz({required this.name, required this.description, required this.questions});

  set name(String name) => this.name = name;
  set description(String description) => this.description = description;

  Map<String, Object?> toJson() => {
    'name': name,
    'description': description,
    'questions': questions.map((e) => e.toJson()).toList(),
  };

}
