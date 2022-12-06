import 'package:flutter/material.dart';
import 'package:mobile/search_engine/screens/search_screen.dart';

class SearchItem extends StatelessWidget {
  final int itemIndex;
  final String itemDescription;
  final SearchItemType searchItemType;

  const SearchItem(
      {super.key,
      required this.itemIndex,
      required this.searchItemType,
      required this.itemDescription});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('clicked $itemIndex'),
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
    switch (searchItemType) {
      case SearchItemType.quiz:
        return Image.asset(
          "assets/images/quiz.png",
          width: 50,
          height: 50,
        );
      case SearchItemType.flashcard:
        return Image.asset(
          "assets/images/flash-cards.png",
          width: 50,
          height: 50,
        );
    }
  }

  Widget _itemType() {
    switch (searchItemType) {
      case SearchItemType.quiz:
        return const Text(
          'Quiz',
          textAlign: TextAlign.end,
        );
      case SearchItemType.flashcard:
        return const Text('Fiszka');
    }
  }

  Color _setColor() {
    if (itemIndex % 2 == 0) {
      return const Color(0xFFC5C5C5);
    } else {
      return const Color(0xFFE3E3E3);
    }
  }
}
