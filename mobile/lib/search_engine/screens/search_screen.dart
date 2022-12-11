import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/custom_navigation_bar.dart';
import 'package:mobile/search_engine/widgets/search_bar.dart';
import 'package:mobile/search_engine/widgets/search_container.dart';
import 'package:mobile/search_engine/widgets/search_engine_header.dart';
import 'package:mobile/search_engine/widgets/search_filter.dart';

enum SearchFilterType{ all, quiz, flashcard, }

class SearchScreenPage extends StatelessWidget {
  const SearchScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchEngineHeader(),
            SearchBar(),
            const SearchFilter(),
            const SearchContainer(),
            const CustomNavigationBar(),
          ],
        ),
      ),
    );
  }

}