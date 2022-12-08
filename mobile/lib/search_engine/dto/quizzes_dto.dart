import 'package:mobile/search_engine/dto/quiz_dto.dart';

class QuizzesDto{
  final List<QuizDto> quizzes;

  QuizzesDto({required this.quizzes});

  factory QuizzesDto.fromJson(Map<String, dynamic> json) => QuizzesDto(
      quizzes: (json['quizzes'] as List)
          .map((i) => QuizDto.fromJson(i))
          .toList());
}