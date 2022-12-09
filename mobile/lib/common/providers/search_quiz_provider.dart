import 'package:flutter/material.dart';
import 'package:mobile/search_engine/dto/get_items.dart';
import 'package:mobile/search_engine/dto/quiz_dto.dart';
import 'package:mobile/search_engine/dto/quizzes_dto.dart';
import 'package:mobile/search_engine/screens/search_screen.dart';

class SearchScreenProvider with ChangeNotifier {
  late Future<QuizzesDto> futureItems;
  late QuizzesDto items;
  late QuizDto quiz;
  SearchFilterType filter = SearchFilterType.all;

  void searchForItems(String query) async {
    futureItems = getItemsList(query);
    items = await futureItems;
    notifyListeners();
  }

  void setFilter(SearchFilterType filter){
    if(this.filter == filter){
      this.filter = SearchFilterType.all;
    } else {
      this.filter = filter;
    }
    notifyListeners();
  }

}