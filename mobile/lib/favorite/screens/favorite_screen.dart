import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/common/widgets/custom_navigation_bar.dart';
import 'package:mobile/favorite/dto/favorite_dto.dart';
import 'package:mobile/favorite/widgets/favorite_filter_container.dart';
import 'package:mobile/favorite/widgets/favorite_filter_widget.dart';
import 'package:mobile/favorite/widgets/favorite_header.dart';
import 'package:mobile/search_engine/dto/item_dto.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobile/search_engine/widgets/search_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteList list;
  late FavoriteList filteredList;
  final tokenStorage = const FlutterSecureStorage();
  final LocalStorage storage = LocalStorage('favorites');
  late Future<String?> token = tokenStorage.read(key: 'token');
  ItemType filter = ItemType.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const FavoriteHeader(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: FavoriteFilterContainer(
                    itemType: ItemType.quiz, isHighlighted: filter),
                onTap: () => {
                  setState(() {
                    if (filter == ItemType.quiz) {
                      filter = ItemType.all;
                    } else {
                      filter = ItemType.quiz;
                    }
                  }),
                },
              ),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    if (filter == ItemType.flashcard) {
                      filter = ItemType.all;
                    } else {
                      filter = ItemType.flashcard;
                    }
                  }),
                },
                child: FavoriteFilterContainer(
                    itemType: ItemType.flashcard, isHighlighted: filter),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
                future: token,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String data = snapshot.data!;
                    Map<String, dynamic> payload = JwtDecoder.decode(data);
                    int id = payload['id'];
                    var items = storage.getItem('favorites');
                    if (items == null) {
                      return const Center(child: Text("No favorites found..."));
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
                          .where((element) => element.userId == id),
                    );
                    _filterList();
                    if (filteredList.items.isEmpty) {
                      return const Center(child: Text("No favorites found..."));
                    } else {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(8),
                          itemCount: filteredList.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SearchItem(
                              itemIndex: filteredList.items[index].taskId, 
                              itemType: _getStringAsItemType(filteredList.items[index].itemType)!, 
                              itemDescription: filteredList.items[index].title
                            );
                          });
                    }
                  } else {
                    return const Center(child: Text("No token found. Please login to continue..."));
                  }
                }),
          ),
          const CustomNavigationBar(),
        ],
      ),
    ));
  }

  void _filterList() {
    filteredList = FavoriteList();
    if (filter == ItemType.all) {
      filteredList = list;
      return;
    }
    String filterString = _getFilterAsString();
    for (int i = 0; i < list.items.length; i++) {
      if (list.items[i].itemType == filterString) {
        filteredList.items.add(list.items[i]);
      }
    }
  }

  String _getFilterAsString() {
    if (filter == ItemType.flashcard) {
      return "flashcard";
    } else if (filter == ItemType.quiz) {
      return "quiz";
    }
    return "all";
  }

  ItemType? _getStringAsItemType(String str) {
    if (str == "flashcard") {
      return ItemType.flashcard;
    } else if (str == "quiz") {
      return ItemType.quiz;
    }
    return ItemType.all;
  }
}
