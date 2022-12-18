import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/custom_navigation_bar.dart';
import 'package:mobile/favorite/widgets/favorite_container.dart';
import 'package:mobile/favorite/widgets/favorite_header.dart';
import 'package:mobile/search_engine/widgets/search_filter.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: const [
          FavoriteHeader(),
          SearchFilter(),
          FavoriteContainer(),
          CustomNavigationBar(),
        ],
      ),
    ));
  }
}
