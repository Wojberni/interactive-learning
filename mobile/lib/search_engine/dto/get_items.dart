import 'dart:convert';

import 'package:learning_api/api.dart';
import 'package:mobile/search_engine/dto/item_dto.dart';


import '../../api/ApiClient.dart';

Future<List<ItemDto>> getItemsList(String query) async {
  SearchResponse? searchResponse = await SearchEndpointApi(apiClient).search(query);
  if (searchResponse != null) {
    Map<String, dynamic> json = jsonDecode(jsonEncode(searchResponse));
    return (json as List).map((i) => ItemDto.fromJson(i)).toList();
  }
  throw Exception('Failed to load searched items');
}