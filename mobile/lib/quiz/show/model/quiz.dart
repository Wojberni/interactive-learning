import './question.dart';

class Quiz{
  final int quizId;
  final List<Question> questions;

  const Quiz({required this.quizId, required this.questions});

  Map<String, Object?> toJson() => {
    'quizId': quizId,
    'questions': questions.map((e) => e.toJson()).toList(),
  };
}