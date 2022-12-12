class FlashcardModel{
  final String question;
  final String answer;

  FlashcardModel({required this.question, required this.answer});

  Map<String, dynamic> toJson() => {
    'content': question,
    'answer': answer,
  };
  
}