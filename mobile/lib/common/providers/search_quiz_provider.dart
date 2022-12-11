import 'package:flutter/material.dart';
import 'package:mobile/search_engine/dto/get_items.dart';
import 'package:mobile/search_engine/dto/item_dto.dart';
import 'package:mobile/search_engine/screens/search_screen.dart';

class SearchScreenProvider with ChangeNotifier {
  late Future<List<ItemDto>> futureItems;
  late List<ItemDto> items;
  late ItemDto quiz;
  SearchFilterType filter = SearchFilterType.all;

  void searchForItems(String query) async {
    futureItems = getItemsList(query)
        .then((value) => items = value)
        .catchError((onError) => items = []);
    notifyListeners();
  }

  void setFilter(SearchFilterType filter) {
    if (this.filter == filter) {
      this.filter = SearchFilterType.all;
    } else {
      this.filter = filter;
    }
    notifyListeners();
  }
}
