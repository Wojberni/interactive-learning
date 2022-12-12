class FlashcardDTO {
  final int id;
  final String content;
  final String answer;

  FlashcardDTO({required this.id, required this.content, required this.answer});

  factory FlashcardDTO.fromJSON(Map<String, dynamic> json) => FlashcardDTO(
        id: json['id'] as int,
        content: json['content'] as String,
        answer: json['answer'] as String,
      );

  Map<String, dynamic> toJSON() => {
        'id': id,
        'content': content,
        'answer': answer,
      };
}
