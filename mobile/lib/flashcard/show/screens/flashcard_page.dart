import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:learning_api/api.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/common/helpers/snackbar.dart';
import 'package:mobile/favorite/dto/favorite_dto.dart';
import 'package:mobile/flashcard/show/models/flashcard_dto.dart';
import 'package:mobile/flashcard/show/widgets/flashcard_container.dart';
import 'package:mobile/profile/widgets/navigation_button.dart';

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
  late int userId;

  @override
  Widget build(BuildContext context) {
    const tokenStorage = FlutterSecureStorage();
    _getFlashcard(context);
    print(widget.id);

    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<FlashcardDTO?>(
          future: _getFlashcard(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              FlashcardDTO? flashcard = snapshot.data;
              question = flashcard!.content;
              answer = flashcard.answer;
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const HeaderFlashcard(),
                      Expanded(
                        flex: 8,
                        child: FlashcardContainer(
                            flashcard.content, flashcard.answer),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child: FutureBuilder(
                            future: tokenStorage.read(key: 'token'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                String? token = snapshot.data!;
                                Map<String, dynamic> payload =
                                    JwtDecoder.decode(token);
                                userId = payload['id'];
                                _checkFavoriteStatus(widget.id);
                                switch (isFavorite) {
                                  case true:
                                    return NavigationButton(
                                        "Usuń z ulubionych", _changeFavoriteStatus);
                                  case false:
                                    return NavigationButton(
                                        "Dodaj do ulubionych", _changeFavoriteStatus);
                                  default:
                                    return NavigationButton(
                                        "Dodaj do ulubionych", _changeFavoriteStatus);
                                }
                              } else {
                                return NavigationButton(
                                    "Dodaj do ulubionych", _changeFavoriteStatus);
                              }
                            },
                          )),
                    ],
                  )
                ],
              );
            } else if (snapshot.hasError) {
              // TODO: add better looking error message later
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

  void _changeFavoriteStatus() {
    FavoriteList list = FavoriteList();
    final LocalStorage storage = LocalStorage('favorites');
    var items = storage.getItem('favorites');
    if (items == null) {
      list.items = [];
      FavoriteItem item = FavoriteItem(
          userId: userId,
          taskId: widget.id,
          title: question,
          itemType: "flashcard");
      list.items.add(item);
      setState(() {
        isFavorite = true;
      });
      showSnackBar(context, "Pomyślnie dodano fiszkę do ulubionych!",
            SnackBarType.success);
      storage.setItem('favorites', list.toJSONEncodable());
      return;
    }
    list.items = List<FavoriteItem>.from(
      (items as List).map(
        (item) => FavoriteItem(
          userId: item['user_id'],
          taskId: item['task_id'],
          title: item['title'],
          itemType: item['item_type'],
        ),
      ),
    );

    switch (isFavorite) {
      case true:
        for (int i = 0; i < list.items.length; i++) {
          if (list.items[i].userId == userId &&
              list.items[i].taskId == widget.id &&
              list.items[i].itemType == "flashcard") {
            list.items.removeAt(i);
            break;
          }
        }
        setState(() {
          isFavorite = false;
        });
        showSnackBar(context, "Pomyślnie usunięto fiszkę z ulubionych!",
            SnackBarType.success);
        break;
      case false:
        FavoriteItem item = FavoriteItem(
            userId: userId,
            taskId: widget.id,
            title: question,
            itemType: "flashcard");
        list.items.add(item);
        setState(() {
          isFavorite = true;
        });
        showSnackBar(context, "Pomyślnie dodano fiszkę do ulubionych!",
            SnackBarType.success);
        break;
    }
    storage.setItem('favorites', list.toJSONEncodable());
  }

  void _checkFavoriteStatus(int taskId) {
    FavoriteList list;
    final LocalStorage storage = LocalStorage('favorites');
    var items = storage.getItem('favorites');
    if (items == null) {
      isFavorite = false;
      print("No favorites saved");
      return;
    }
    list = FavoriteList();
    list.items = List<FavoriteItem>.from(
      (items as List)
          .map(
            (item) => FavoriteItem(
              userId: item['user_id'],
              taskId: item['task_id'],
              title: item['title'],
              itemType: item['item_type'],
            ),
          )
          .where((element) => element.userId == userId)
          .where((element) => element.taskId == taskId)
          .where((element) => element.itemType == "flashcard"),
    );
    if (list.items.isEmpty) {
      isFavorite = false;
      print("Not favorited");
    } else {
      isFavorite = true;
      print("Favorited");
    }
  }
}
