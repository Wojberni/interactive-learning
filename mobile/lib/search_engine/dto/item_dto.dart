enum ItemType{ quiz, flashcard, }

class ItemDto {
  ItemDto(
      {required this.id,
      required this.title,
      required this.description,
      required this.kind});

  final int id;
  final String title;
  final String description;
  final String kind;

  factory ItemDto.fromJson(Map<String, dynamic> json) => ItemDto(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      kind: json['kind']);

  static ItemType getItemType(String kind){
    switch(kind){
      case 'QUIZ':
        return ItemType.quiz;
      case 'FLASHCARD':
        return ItemType.flashcard;
      default:
        throw Exception('Unknown item type');
    }
  }
}
