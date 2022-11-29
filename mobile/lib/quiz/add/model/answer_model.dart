class AnswerModel{
  final String content;
  final bool isCorrect;

  AnswerModel({required this.content, required this.isCorrect});

  Map<String, Object?> toJson() => {
    'content': content,
    'isCorrect': isCorrect,
  };
}