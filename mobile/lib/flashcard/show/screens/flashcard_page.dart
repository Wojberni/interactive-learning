import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/common/providers/item_list_provider.dart';
import 'package:mobile/flashcard/show/models/flashcard_dto.dart';
import 'package:mobile/flashcard/show/widgets/flashcard_container.dart';
import 'package:mobile/profile/widgets/navigation_button.dart';
import 'package:mobile/search_engine/dto/item_dto.dart';
import 'package:mobile/search_engine/dto/results_dto.dart';
import 'package:provider/provider.dart';

import '../widgets/header_flashcard.dart';
import 'package:flutter/material.dart';

class FlashcardPage extends StatefulWidget {
  const FlashcardPage(this.id, {super.key});
  final int id;

  @override
  State<FlashcardPage> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  String question = "Question";
  String answer = "Answer";
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    context.read<ItemListProvider>().clearProvider();
    context.read<ItemListProvider>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    _getFlashcard(context);

    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<FlashcardDTO?>(
          future: _getFlashcard(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              FlashcardDTO? flashcard = snapshot.data;
              question = flashcard!.content;
              answer = flashcard.answer;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const HeaderFlashcard(),
                  Expanded(
                    flex: 8,
                    child:
                        FlashcardContainer(flashcard.content, flashcard.answer),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: FutureBuilder(
                      future: context.watch<ItemListProvider>().futureItems,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.active:
                          case ConnectionState.waiting:
                            return const Center(
                                child: CircularProgressIndicator());
                          case ConnectionState.done:
                            _setFavoriteStatus();
                            if (isFavorite == true) {
                              return NavigationButton(
                                  "Usuń z ulubionych", _changeFavoriteStatus);
                            } else {
                              return NavigationButton(
                                  "Dodaj do ulubionych", _changeFavoriteStatus);
                            }
                        }
                      },
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    ));
  }

  Future<FlashcardDTO?> _getFlashcard(BuildContext context) async {
    FlashcardDetailsResponse? response =
        await FlashcardEndpointApi(apiClient).getById(widget.id);
    if (response != null) {
      Map<String, dynamic> json = jsonDecode(jsonEncode(response));
      return FlashcardDTO.fromJSON(json);
    }
    return null;
  }

  void _changeFavoriteStatus() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    String? userId = await storage.read(key: 'id');
    if (userId == null) return;
    ResultsDto items =
        Provider.of<ItemListProvider>(context, listen: false).items;

    int idx = _findTaskInFavorites();

    if (idx == -1) {
      ItemDto newItem = ItemDto(
          id: widget.id,
          title: question,
          description: '',
          author: '',
          successRate: 0,
          kind: ItemType.flashcard);
      items.results.add(newItem);
      storage.write(key: 'favorites_' + userId, value: jsonEncode(items));
      setState(() {
        isFavorite = true;
      });
    } else {
      items.results.removeAt(idx);
      storage.write(key: 'favorites_' + userId, value: jsonEncode(items));
      setState(() {
        isFavorite = false;
      });
    }
  }

  int _findTaskInFavorites() {
    ResultsDto items =
        Provider.of<ItemListProvider>(context, listen: false).items;
    int idx = -1;
    for (int i = 0; i < items.results.length; i++) {
      if (items.results[i].id == widget.id &&
          items.results[i].kind == ItemType.flashcard) {
        idx = i;
        return idx;
      }
    }
    return idx;
  }

  void _setFavoriteStatus() {
    int idx = _findTaskInFavorites();
    isFavorite = (idx != -1);
  }
}
