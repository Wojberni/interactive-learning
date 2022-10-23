import 'package:flutter/material.dart';
import 'package:mobile/home_page.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/registration_page.dart';

void main() {
  bool loggedIn = false;

  runApp(
    MaterialApp(
      title: 'Interactive Learning',
      home: loggedIn ? const HomePage() : LoginPage(),
      routes: {
        'loginPage': (_) => const LoginPage(),
        'registrationPage': (_) => const RegistrationPage(),
        'homePage': (_) => const HomePage(),
      },
    )
  );
}






