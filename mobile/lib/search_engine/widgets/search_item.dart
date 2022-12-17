import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/search_engine/dto/item_dto.dart';

class SearchItem extends StatelessWidget {
  final int itemIndex;
  final String itemDescription;
  final ItemType itemType;

  const SearchItem(
      {super.key,
      required this.itemIndex,
      required this.itemType,
      required this.itemDescription});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleNavigationTap(context),
      child: Container(
        decoration: BoxDecoration(
          color: _setColor(),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(padding: const EdgeInsets.all(8.0), child: _itemImage()),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    itemDescription,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              _itemType(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemImage() {
    switch (itemType) {
      case ItemType.quiz:
        return Image.asset(
          "assets/images/quiz.png",
          width: 50,
          height: 50,
        );
      case ItemType.flashcard:
        return Image.asset(
          "assets/images/flash-cards.png",
          width: 50,
          height: 50,
        );
      default:
        throw Exception("Invalid item type");
    }
  }

  Widget _itemType() {
    switch (itemType) {
      case ItemType.quiz:
        return const Text(
          'Quiz',
        );
      case ItemType.flashcard:
        return const Text(
          'Fiszka',
        );
      default:
        throw Exception("Invalid item type");
    }
  }

  Color _setColor() {
    if (itemIndex % 2 == 0) {
      return const Color(0xFFC5C5C5);
    } else {
      return const Color(0xFFE3E3E3);
    }
  }

  void _handleNavigationTap(BuildContext context) {
    
  }
}
