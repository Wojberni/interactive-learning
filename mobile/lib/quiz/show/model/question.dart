import 'answer.dart';

class Question{

  final String content;
  final List<Answer> answers;

  Question({
    required this.content,
    required this.answers});

  Map<String, Object?> toJson() => {
    'content': content,
    'answers': answers.map((e) => e.toJson()).toList(),
  };
}