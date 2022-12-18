import 'package:flutter/material.dart';
import 'package:mobile/common/providers/item_list_provider.dart';
import 'package:mobile/search_engine/dto/item_dto.dart';
import 'package:provider/provider.dart';

class FilterContainer extends StatelessWidget {
  final ItemType itemType;

  const FilterContainer({super.key, required this.itemType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.read<ItemListProvider>().setFilter(itemType),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: _setBorder(context),
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFB1FFB1),
        ),
        child: _getImage(),
      ),
    );
  }

  Widget _getImage() {
    if (itemType == ItemType.quiz) {
      return Image.asset(
        'assets/images/quiz.png',
        width: 40,
        height: 40,
      );
    }
    if (itemType == ItemType.flashcard) {
      return Image.asset(
        'assets/images/flash-cards.png',
        width: 40,
        height: 40,
      );
    }
    return const SizedBox();
  }

  Border _setBorder(BuildContext context) {
    return context.watch<ItemListProvider>().filter == itemType
        ? Border.all(
            color: Colors.red,
            width: 3,
          )
        : Border.all(
            color: const Color(0xFF000000),
            width: 1,
          );
  }
}
