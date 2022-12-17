import 'package:flutter/material.dart';
import 'package:mobile/favorite/widgets/favorite_filter_container.dart';
import 'package:mobile/search_engine/dto/item_dto.dart';
import 'package:mobile/search_engine/widgets/filter_container.dart';

class FavoriteSearchFilter extends StatelessWidget {
  const FavoriteSearchFilter({
    super.key, required this.filter
  });
  final ItemType filter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FavoriteFilterContainer(itemType: ItemType.quiz, isHighlighted: filter),
        FavoriteFilterContainer(itemType: ItemType.flashcard, isHighlighted: filter),
      ],
    );
  }
}
