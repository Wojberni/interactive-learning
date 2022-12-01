class Answer{
  final String content;
  final bool isCorrect;

  Answer({required this.content, required this.isCorrect});

  Map<String, Object?> toJson() => {
    'content': content,
    'isCorrect': isCorrect,
  };
}