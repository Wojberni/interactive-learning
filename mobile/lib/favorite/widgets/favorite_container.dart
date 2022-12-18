import 'package:flutter/material.dart';
import 'package:mobile/common/providers/item_list_provider.dart';
import 'package:mobile/search_engine/widgets/search_item.dart';
import 'package:provider/provider.dart';

class FavoriteContainer extends StatefulWidget {
  const FavoriteContainer({super.key});

  @override
  State<FavoriteContainer> createState() => _FavoriteContainerState();
}

class _FavoriteContainerState extends State<FavoriteContainer> {
  @override
  void initState() {
    super.initState();
    context.read<ItemListProvider>().clearProvider();
    context.read<ItemListProvider>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.watch<ItemListProvider>().futureItems,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Expanded(
                child: Center(child: CircularProgressIndicator()));
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const Expanded(
                  child: Center(child: Text('No favorites found')));
            } else {
              return Consumer<ItemListProvider>(
                builder: (context, provider, child) => _buildListView(provider),
              );
            }
        }
      },
    );
  }

  Widget _buildListView(ItemListProvider provider) {
    if (provider.filteredItems.results.isEmpty) {
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
          itemCount: provider.filteredItems.results.length,
          itemBuilder: (context, index) {
            return SearchItem(
              itemIndex: index,
              itemType: provider.filteredItems.results[index].kind,
              itemDescription: provider.filteredItems.results[index].title,
            );
          },
        ),
      ),
    );
  }
}
