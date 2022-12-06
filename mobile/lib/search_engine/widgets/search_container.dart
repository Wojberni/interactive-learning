import 'package:flutter/material.dart';
import 'package:mobile/search_engine/widgets/search_item.dart';

import '../screens/search_screen.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return SearchItem(
                itemIndex: index,
                searchItemType: SearchItemType.quiz,
                itemDescription: "This is the test for the best experience or the customer");
          },
        ),
      ),
    );
  }
}
