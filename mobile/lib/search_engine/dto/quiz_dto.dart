class QuizDto {
  QuizDto(
      {required this.name,
      required this.description,
      required this.createdByUsername});

  final String name;
  final String description;
  final String createdByUsername;

  factory QuizDto.fromJson(Map<String, dynamic> json) => QuizDto(
      name: json['name'],
      description: json['description'],
      createdByUsername: json['createdByUsername']);
}
