import 'dart:convert';

import 'package:learning_api/api.dart';
import 'package:mobile/search_engine/dto/quizzes_dto.dart';

import '../../api/ApiClient.dart';

Future<QuizzesDto> getAllItems() async {
  QuizListResponse? quizListResponse =
  await QuizEndpointApi(apiClient).getAllQuizzes();
  if (quizListResponse != null) {
    Map<String, dynamic> json = jsonDecode(jsonEncode(quizListResponse));
    return QuizzesDto.fromJson(json);
  }
  throw Exception('Failed to load all items');
}

Future<QuizzesDto> getItemsList(String query) async {
  if (query.isEmpty) {
    return getAllItems();
  }
  throw Exception('Failed to load searched items');
}