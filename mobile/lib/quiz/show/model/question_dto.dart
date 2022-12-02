import 'answer_dto.dart';

class QuestionDto {
  final String content;
  final List<AnswerDto> answers;

  QuestionDto({required this.content, required this.answers});

  factory QuestionDto.fromJson(Map<String, dynamic> json) => QuestionDto(
        content: json['content'] as String,
        answers: (json['answers'] as List).map((i) =>
          AnswerDto.fromJson(i)).toList()
      );

  Map<String, dynamic> toJson() => {
        'content': content,
        'answers': answers.map((i) => i.toJson()).toList(),
      };
}
