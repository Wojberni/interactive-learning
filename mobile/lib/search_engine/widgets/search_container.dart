import 'package:flutter/material.dart';
import 'package:mobile/common/providers/search_quiz_provider.dart';
import 'package:mobile/search_engine/widgets/search_item.dart';
import 'package:provider/provider.dart';

import '../dto/get_items.dart';
import '../dto/quizzes_dto.dart';
import '../screens/search_screen.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  void initState() {
    super.initState();
    context.read<SearchScreenProvider>().futureItems = getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.watch<SearchScreenProvider>().futureItems,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Consumer<SearchScreenProvider>(
            builder: (context, provider, child) =>
                _buildListView(provider, snapshot.data),
          );
        } else if (snapshot.hasError) {
          return Expanded(child: Center(child: Text('Error: ${snapshot.error}')));
        } else {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _buildListView(SearchScreenProvider provider, QuizzesDto? quizzesDto) {
    if (quizzesDto == null) {
      throw Exception('quiz list cant be null');
    }
    provider.items = quizzesDto;
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: provider.items.quizzes.length,
          itemBuilder: (context, index) {
            return SearchItem(
              itemIndex: index,
              searchItemType: SearchItemType.quiz,
              itemDescription: provider.items.quizzes[index].description,
            );
          },
        ),
      ),
    );
  }
}
