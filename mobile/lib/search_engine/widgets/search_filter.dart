import 'package:flutter/material.dart';
import 'package:mobile/search_engine/screens/search_screen.dart';
import 'package:mobile/search_engine/widgets/filter_container.dart';

class SearchFilter extends StatelessWidget{
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        FilterContainer(searchFilterType: SearchFilterType.quiz),
        FilterContainer(searchFilterType: SearchFilterType.flashcard),
      ],
    );
  }

}