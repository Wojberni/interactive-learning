enum ItemType { quiz, flashcard, all }

class ItemDto {
  ItemDto(
      {required this.id,
      required this.title,
      required this.description,
      required this.author,
      required this.successRate,
      required this.kind});

  final int id;
  final String title;
  final String description;
  final String author;
  final int successRate;
  final ItemType kind;

  factory ItemDto.fromJson(Map<String, dynamic> json) => ItemDto(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      author: json['author'],
      successRate: json['successRate'],
      kind: getItemType(json['kind']));

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'author': author,
        'successRate': successRate,
        'kind': setItemType(kind),
      };
}

ItemType getItemType(String kind) {
  switch (kind) {
    case 'QUIZ':
      return ItemType.quiz;
    case 'FLASHCARD':
      return ItemType.flashcard;
    default:
      throw Exception('Unknown item type');
  }
  
}

String setItemType(ItemType kind){
  switch(kind){
    case ItemType.quiz:
      return 'QUIZ';
    case ItemType.flashcard:
      return 'FLASHCARD';
    default:
      throw Exception('Unknown item type');
  }

}
