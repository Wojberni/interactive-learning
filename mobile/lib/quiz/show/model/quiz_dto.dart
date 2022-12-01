import './question_dto.dart';

class QuizDto {
  final int quizId;
  final List<QuestionDto> questions;

  QuizDto({required this.quizId, required this.questions});

  factory QuizDto.fromJson(Map<String, dynamic> json) => QuizDto(
        quizId: json['quizId'] as int,
        questions: (json['questions'] as List).map((i) =>
            QuestionDto.fromJson(i)).toList()
      );

  Map<String, dynamic> toJson() => {
        'quizId': quizId,
        'questions': questions.map((i) => i.toJson()).toList(),
      };
}
