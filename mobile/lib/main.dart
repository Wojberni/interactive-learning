import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/add_quiz/screens/add_quiz_page.dart';
import 'package:mobile/home/screens/home_page.dart';
import 'package:mobile/login_register/screens/login_page.dart';
import 'package:mobile/login_register/screens/registration_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/profile/screens/profile_page.dart';
import 'package:mobile/show_quiz/screens/question_page.dart';
import 'package:mobile/show_quiz/screens/quiz_page.dart';

import 'add_quiz/screens/add_quiz_answers.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
  runApp(MyApp());
      });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // todo: read token from flutter_secure_storage
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Interactive Learning',
      routerConfig: _router,
    );
  }

  //todo: extract it to separate file (common folder)
  final GoRouter _router = GoRouter(
    initialLocation: '/auth/login',
    routes: <GoRoute>[
      GoRoute(
        path: '/auth/login',
        builder: (BuildContext context, GoRouterState state) =>
            const LoginPage(),
      ),
      GoRoute(
        path: '/auth/register',
        builder: (BuildContext context, GoRouterState state) =>
            const RegistrationPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) =>
        const HomePage(),
      ),
      GoRoute(
        path: '/random_task', // temporary path
        builder: (BuildContext context, GoRouterState state) =>
        QuizPage(),
      ),
      GoRoute(
        path: '/random_task/question', // temporary path
        builder: (BuildContext context, GoRouterState state) =>
        const QuestionPage(),
      ),
      GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) =>
        const ProfilePage(),
      ),
      GoRoute(
        path: '/search', // temporary path
        builder: (BuildContext context, GoRouterState state) =>
        const AddQuizPage(),
      ),
      GoRoute(
        path: '/search/add_quiz', // temporary path
        builder: (BuildContext context, GoRouterState state) =>
        const AddQuizAnswers(),
      ),
    ],
  );
}
