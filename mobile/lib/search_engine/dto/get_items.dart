import 'dart:convert';

import 'package:learning_api/api.dart';
import 'package:mobile/search_engine/dto/results_dto.dart';


import '../../api/ApiClient.dart';

Future<ResultsDto> getItemsList(String query) async {
  SearchResponse? searchResponse = await SearchEndpointApi(apiClient).search(query);
  if (searchResponse != null) {
    Map<String, dynamic> json = jsonDecode(jsonEncode(searchResponse));
    return ResultsDto.fromJson(json);
  }
  throw Exception('Failed to load searched items');
}