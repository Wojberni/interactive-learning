import 'package:flutter/material.dart';
import 'package:mobile/home_page.dart';
import 'package:mobile/login_page.dart';

void main() {
  runApp(const InteractiveLearningApp());
}

class InteractiveLearningApp extends StatelessWidget {
  const InteractiveLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool loggedIn = false;
    if(!loggedIn) {
      return const MaterialApp(home: LoginPage());
    }
    else {
      return const HomePage();
    }
  }

}



