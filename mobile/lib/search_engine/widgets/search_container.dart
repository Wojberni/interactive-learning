import 'package:flutter/material.dart';
import 'package:mobile/common/providers/search_quiz_provider.dart';
import 'package:mobile/search_engine/widgets/search_item.dart';
import 'package:provider/provider.dart';

import '../dto/item_dto.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  void initState() {
    super.initState();
    context.read<SearchScreenProvider>().searchForItems('');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.watch<SearchScreenProvider>().futureItems,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Expanded(
                child: Center(child: CircularProgressIndicator()));
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Expanded(
                  child: Center(child: Text('Error: ${snapshot.error}')));
            } else {
              return Consumer<SearchScreenProvider>(
                builder: (context, provider, child) => _buildListView(provider),
              );
            }
        }
      },
    );
  }

  Widget _buildListView(SearchScreenProvider provider) {
    if (provider.items.results.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text('No items found'),
        ),
      );
    }
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: provider.items.results.length,
          itemBuilder: (context, index) {
            return SearchItem(
              itemIndex: index,
              itemType: ItemDto.getItemType(provider.items.results[index].kind),
              itemDescription: provider.items.results[index].title,
            );
          },
        ),
      ),
    );
  }
}
