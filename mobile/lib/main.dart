import 'package:flutter/material.dart';
import 'package:mobile/home_page.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/registration_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final bool loggedIn = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Learning',
      home: loggedIn ? const HomePage() : const LoginPage(),
      routes: {
        'loginPage': (_) => const LoginPage(),
        'registrationPage': (_) => const RegistrationPage(),
        'homePage': (_) => const HomePage(),
      },
    );
  }
}
