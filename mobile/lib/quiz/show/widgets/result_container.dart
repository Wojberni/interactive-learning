import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/common/providers/item_list_provider.dart';
import 'package:mobile/profile/widgets/navigation_button.dart';
import 'package:mobile/quiz/common/widgets/quiz_button.dart';
import 'package:mobile/quiz/show/widgets/high_score_container.dart';
import 'package:mobile/search_engine/dto/get_items.dart';
import 'package:mobile/search_engine/dto/item_dto.dart';
import 'package:mobile/search_engine/dto/results_dto.dart';
import 'package:provider/provider.dart';

import '../provider/show_quiz_provider.dart';
import 'low_score_container.dart';

class ResultContainer extends StatefulWidget {
  ResultContainer({Key? key, required this.provider}) : super(key: key);

  final ShowQuizProvider provider;
  bool isFavorite = false;

  @override
  State<ResultContainer> createState() => _ResultContainerState();
}

class _ResultContainerState extends State<ResultContainer> {
  @override
  void initState() {
    super.initState();
    context.read<ItemListProvider>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          const Text(
            'Koniec quizu!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Twój wynik to...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          _showScore(),
          _toggleFavoritesButton(context),
        ],
      ),
    );
  }

  Widget _showScore() {
    if (widget.provider.userQuizData.userScore >= 50.0) {
      return HighScoreContainer(
          score:
              '${widget.provider.userQuizData.userScore.toStringAsFixed(0)}%');
    } else {
      return LowScoreContainer(
          score:
              '${widget.provider.userQuizData.userScore.toStringAsFixed(0)}%');
    }
  }

  Widget _toggleFavoritesButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: FutureBuilder(
        future: context.watch<ItemListProvider>().futureItems,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              _setFavoriteStatus();
              if (widget.isFavorite == true) {
                return NavigationButton(
                    "Usuń z ulubionych", _changeFavoriteStatus);
              } else {
                return NavigationButton(
                    "Dodaj do ulubionych", _changeFavoriteStatus);
              }
          }
        },
      ),
    );
  }

  Future<ItemDto?> _getQuiz(int quiz_id) async {
    ResultsDto? response = await getItemsList('');
    
      for (int i = 0; i < response.results.length; i++) {
        if (response.results[i].id == quiz_id) return response.results[i];
      }
    return null;
  }

  void _changeFavoriteStatus() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    String? userId = await storage.read(key: 'id');
    if (userId == null) return;
    ResultsDto items =
        Provider.of<ItemListProvider>(context, listen: false).items;
    ItemDto? quiz = await _getQuiz(widget.provider.quiz.quizId);
    if (quiz == null) {
      print("No quiz found");
      return;
    }

    int idx = _findTaskInFavorites();

    if (idx == -1) {
      ItemDto newItem = ItemDto(
        id: widget.provider.quiz.quizId,
        title: quiz.title,
        description: quiz.description,
        author: quiz.author,
        successRate: quiz.successRate, // will be updated on click anyways
        kind: ItemType.quiz
      );
      items.results.add(newItem);
      storage.write(key: 'favorites_' + userId, value: jsonEncode(items));
      setState(() {
        widget.isFavorite = true;
      });
    } else {
      items.results.removeAt(idx);
      storage.write(key: 'favorites_' + userId, value: jsonEncode(items));
      setState(() {
        widget.isFavorite = false;
      });
    }
  }

  int _findTaskInFavorites() {
    ResultsDto items =
        Provider.of<ItemListProvider>(context, listen: false).items;
    int idx = -1;
    for (int i = 0; i < items.results.length; i++) {
      if (items.results[i].id == widget.provider.quiz.quizId &&
          items.results[i].kind == ItemType.quiz) {
        idx = i;
        return idx;
      }
    }
    return idx;
  }

  void _setFavoriteStatus() {
    int idx = _findTaskInFavorites();
    widget.isFavorite = (idx != -1);
  }
}
