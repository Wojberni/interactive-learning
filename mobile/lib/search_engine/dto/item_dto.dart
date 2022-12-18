enum ItemType{ quiz, flashcard, all}

class ItemDto {
  ItemDto(
      {required this.id,
      required this.title,
      required this.description,
      required this.kind});

  final int id;
  final String title;
  final String description;
  final ItemType kind;

  factory ItemDto.fromJson(Map<String, dynamic> json) => ItemDto(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      kind: getItemType(json['kind']));

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['id'] = id;
    m['description'] = description;
    m['title'] = title;
    m['kind'] = kind;

    return m;
  }
}

ItemType getItemType(String kind){
  switch(kind){
    case 'QUIZ':
      return ItemType.quiz;
    case 'FLASHCARD':
      return ItemType.flashcard;
    default:
      throw Exception('Unknown item type');
  }
  
}