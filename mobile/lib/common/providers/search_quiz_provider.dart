import 'package:flutter/material.dart';
import 'package:mobile/search_engine/dto/get_items.dart';
import 'package:mobile/search_engine/dto/item_dto.dart';
import 'package:mobile/search_engine/dto/results_dto.dart';

class SearchScreenProvider with ChangeNotifier {
  late Future<ResultsDto> futureItems;
  late ResultsDto items;
  late ResultsDto filteredItems;
  ItemType filter = ItemType.all;

  void searchForItems(String query) async {
    futureItems = getItemsList(query)
        .then((value) => items = value)
        .catchError((onError) => print(onError));
    await futureItems;
    filterResults();
    notifyListeners();
  }

  void setFilter(ItemType filter) {
    if (this.filter == filter) {
      this.filter = ItemType.all;
    } else {
      this.filter = filter;
    }
    filterResults();
    notifyListeners();
  }

  void filterResults() {
    if (items.results.isEmpty) {
      return;
    }
    if (filter == ItemType.all) {
      filteredItems = items;
    } else {
      filteredItems = ResultsDto(
          results: items.results
              .where((element) => element.kind == filter)
              .toList());
    }
    notifyListeners();
  }
}
