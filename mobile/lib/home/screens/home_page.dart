import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final List<String> tilesTitles = [
      'Daily Challenge',
      'Losowe zadanie',
      'Wyszukiwanie',
      'Ulubione'
    ];
    final List<Color> tilesColors = [
      Colors.lightBlueAccent,
      Colors.deepOrangeAccent,
      Colors.lightGreenAccent,
      Colors.pinkAccent
    ];
    //final List<Blob> tilesIcons = [];

    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.1,
            child: const Center(
              child: Text(
                "Nazwa aplikacji / logo",
                style: TextStyle(fontSize: 26, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.76,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(4, (index) {
                return Container(
                  color: tilesColors.elementAt(index),
                  child: Center(
                    child: Text(
                      tilesTitles.elementAt(index),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.1,
            child: const Center(
              child: Text(
                "Home / Account / Timer",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
