import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/custom_navigation_bar.dart';
import 'package:mobile/home/widgets/home_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> tilesTitles = [
      'Daily Challenge',
      'Losowe zadanie',
      'Wyszukiwanie',
      'Ulubione'
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
      'assets/images/pomodoro.png'
    ];
    final List<String> tilesRoutes = [
      '/daily_challenge',
      '/random_task',
      '/search',
      '/pomodoro'
    ];

    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
      child: Column(
        children: [
            Container(
              height: 60,
              color: Colors.white,
              child: const Center(
                child: Text(
                  "Logo <- Interactive Learning App",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                  backgroundColor: Colors.white,
                  fontWeight: FontWeight.bold),
                ),
              ),
            ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              children: List.generate(tilesTitles.length, (index) {
                return HomeTile(
                    title: tilesTitles[index],
                    color: tilesColors[index],
                    iconPath: tilesIcons[index],
                    onTap: () {
                      print('Tapped on tile ${tilesRoutes[index]}');
                      // context.go(tilesRoutes[index]);
                    });
              }),
            ),
          ),
          const CustomNavigationBar(),
        ],
      ),
    )));
  }
}
