import 'package:mobile/search_engine/dto/item_dto.dart';
// TODO: maybe refactor item_dto to commons?

class FavoriteItem {
  int userId;
  int taskId;
  String title;
  String itemType;

  FavoriteItem(
      {required this.userId,
      required this.taskId,
      required this.title,
      required this.itemType});

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['user_id'] = userId;
    m['task_id'] = taskId;
    m['title'] = title;
    m['item_type'] = itemType;

    return m;
  }
}

class FavoriteList {
  List<FavoriteItem> items = [];

  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}