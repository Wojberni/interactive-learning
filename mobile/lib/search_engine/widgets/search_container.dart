import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/common/providers/search_quiz_provider.dart';
import 'package:mobile/search_engine/widgets/search_item.dart';
import 'package:provider/provider.dart';

import '../../api/ApiClient.dart';
import '../dto/quizzes_dto.dart';
import '../screens/search_screen.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getQuizList(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          QuizzesDto? quizzes = snapshot.data;
          SearchScreenProvider provider = context.read<SearchScreenProvider>();
          if (quizzes != null) {
            provider.quizzes = quizzes;
          }
          return Consumer<SearchScreenProvider>(
            builder: (context, provider, child) => _buildListView(provider),
          );
        } else if (snapshot.hasError) {
          return Expanded(child: Text('Error: ${snapshot.error}'));
        } else {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  _buildListView(SearchScreenProvider provider) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: provider.quizzes.quizzes.length,
          itemBuilder: (context, index) {
            return SearchItem(
              itemIndex: index,
              searchItemType: SearchItemType.quiz,
              itemDescription: provider.quizzes.quizzes[index].description,
            );
          },
        ),
      ),
    );
  }

  Future<QuizzesDto?> _getQuizList(BuildContext context) async {
    String query = context.read<SearchScreenProvider>().query;
    if (query.isEmpty) {
      QuizListResponse? quizListResponse =
          await QuizEndpointApi(apiClient).getAllQuizzes();
      if (quizListResponse != null) {
        Map<String, dynamic> json = jsonDecode(jsonEncode(quizListResponse));
        return QuizzesDto.fromJson(json);
      }
    }
    return null;
  }
}
