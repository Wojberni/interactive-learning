import 'package:flutter/material.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/registration_page.dart';

void main() {
  runApp(const InteractiveLearningApp());
}

class InteractiveLearningApp extends StatelessWidget {
  const InteractiveLearningApp({super.key});

  final x =54;

  @override
  Widget build(BuildContext context) {
    bool loggedIn = true;
    if(!loggedIn) {
      return const MaterialApp(home: LoginPage());
    }
    else {
      return const MaterialApp(home: RegistrationPage());
    }
  }

}



