import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/widgets/custom_navigation_bar.dart';
import 'package:mobile/home/widgets/home_tile.dart';

import '../../common/widgets/navigation_bar_selection.dart';
import '../widgets/home_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> tilesTitles = [
      'Dzienne wyzwanie',
      'Losowe zadanie',
      'Wyszukiwanie',
      'Dodaj'
    ];
    final List<Color> tilesColors = [
      const Color(0xFF38FE40),
      const Color(0xFF2E6CF0),
      const Color(0xFFF0AA0A),
      const Color(0xFFF02E83)
    ];
    final List<String> tilesIcons = [
      'assets/images/daily_challenge.png',
      'assets/images/random_task.png',
      'assets/images/search.png',
      'assets/images/add_home.png'
    ];
    final List<String> tilesRoutes = [
      'daily_challenge',
      'random_task',
      'search',
      'choose_method'
    ];

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const HomeLogo(),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              children: List.generate(tilesTitles.length, (index) {
                return HomeTile(
                    title: tilesTitles[index],
                    color: tilesColors[index],
                    iconPath: tilesIcons[index],
                    onTap: () {
                      context.goNamed(tilesRoutes[index]);
                    });
              }),
            ),
          ),
          const CustomNavigationBar(selectedIndex: NavigationBarSelection.home),
        ],
      ),
    ));
  }
}
