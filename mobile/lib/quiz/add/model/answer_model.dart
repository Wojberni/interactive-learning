class AnswerModel{
  final String content;
  final bool isCorrect;

  AnswerModel({required this.content, required this.isCorrect});

  Map<String, dynamic> toJson() => {
    'content': content,
    'isCorrect': isCorrect,
  };
}