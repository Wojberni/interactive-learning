import 'package:flutter/material.dart';
import 'package:mobile/search_engine/screens/search_screen.dart';

class FilterContainer extends StatelessWidget {
  final SearchItemType searchItemType;

  const FilterContainer({super.key, required this.searchItemType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF000000),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFB1FFB1),
      ),
      child: _getImage(),
    );
  }

  Widget _getImage() {
    switch (searchItemType) {
      case SearchItemType.quiz:
        return Image.asset(
          'assets/images/quiz.png',
          width: 40,
          height: 40,
        );
      case SearchItemType.flashcard:
        return Image.asset(
          'assets/images/flash-cards.png',
          width: 40,
          height: 40,
        );
    }
  }
}
