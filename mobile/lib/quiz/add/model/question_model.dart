import 'answer_model.dart';

class QuestionModel{

  final String content;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.content,
    required this.answers});

  Map<String, Object?> toJson() => {
    'content': content,
    'answers': answers.map((e) => e.toJson()).toList(),
  };
}