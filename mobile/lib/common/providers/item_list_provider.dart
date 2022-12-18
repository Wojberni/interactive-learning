import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/search_engine/dto/get_items.dart';
import 'package:mobile/search_engine/dto/item_dto.dart';
import 'package:mobile/search_engine/dto/results_dto.dart';

class ItemListProvider with ChangeNotifier {
  late Future<ResultsDto> futureItems;
  late ResultsDto items;
  late ResultsDto filteredItems;
  ItemType filter = ItemType.all;

  void searchForItems(String query) async {
    futureItems = getItemsList(query).then((value) => items = value);
    //.catchError((onError) => print(onError));
    await futureItems;
    filterResults();
    notifyListeners();
  }

  void getFavorites() async {
    const storage = FlutterSecureStorage();
    String? idString = await storage.read(key: 'id');
    if (idString == null) return;
    String? result = await storage.read(key: 'favorites_' + idString);
    if (result == null) return;
    Map<String, dynamic> json = jsonDecode(result);
    futureItems = getFuture(json).then((value) => items = value);
    await futureItems;
    filterResults();
    notifyListeners();
  }

  void clearProvider() {
    items = ResultsDto(results: []);
    filteredItems = ResultsDto(results: []);
  }

  Future<ResultsDto> getFuture(Map<String, dynamic> json) async {
    return ResultsDto.fromJson(json);
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