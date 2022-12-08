import 'package:flutter/material.dart';
import 'package:mobile/search_engine/dto/quizzes_dto.dart';
import 'package:mobile/search_engine/screens/search_screen.dart';

class SearchScreenProvider with ChangeNotifier {
  late QuizzesDto quizzes;
  String query = '';
  SearchFilterType filter = SearchFilterType.all;

  void setQuery(String query) {
    this.query = query;
    notifyListeners();
  }

}