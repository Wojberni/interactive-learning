class AnswerDto {
  final String content;
  final bool isCorrect;

  AnswerDto({required this.content, required this.isCorrect});

  factory AnswerDto.fromJson(Map<String, dynamic> json) => AnswerDto(
        content: json['content'] as String,
        isCorrect: json['isCorrect'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'content': content,
        'isCorrect': isCorrect,
      };
}
