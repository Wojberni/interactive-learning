import 'package:flutter/material.dart';
import 'package:mobile/common/providers/search_quiz_provider.dart';
import 'package:mobile/search_engine/screens/search_screen.dart';
import 'package:provider/provider.dart';

class FilterContainer extends StatelessWidget {
  final SearchFilterType searchFilterType;

  const FilterContainer({super.key, required this.searchFilterType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _setFilter(context),
      child: Container(
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
      ),
    );
  }

  Widget _getImage() {
    if(searchFilterType == SearchFilterType.quiz){
      return Image.asset(
        'assets/images/quiz.png',
        width: 40,
        height: 40,
      );
    }
    if(searchFilterType == SearchFilterType.flashcard){
      return Image.asset(
        'assets/images/flash-cards.png',
        width: 40,
        height: 40,
      );
    }
    return const SizedBox();
  }

  _setFilter(BuildContext context){
    SearchFilterType searchFilterType = context.read<SearchScreenProvider>().filter;
    if(searchFilterType == this.searchFilterType){
      context.read<SearchScreenProvider>().filter = SearchFilterType.all;
    } else {
      context.read<SearchScreenProvider>().filter = this.searchFilterType;
    }
  }
}
