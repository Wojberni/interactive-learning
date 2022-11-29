import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/profile/screens/profile_page.dart';
import 'package:mobile/quiz/add/screens/add_quiz_page.dart';

import '../home/screens/home_page.dart';
import '../login_register/screens/login_page.dart';
import '../login_register/screens/registration_page.dart';

List<GoRoute> myRoutes(){
  return[
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
/*    GoRoute(
      path: '/random_task', // temporary path
      builder: (BuildContext context, GoRouterState state) =>
      const QuizPage(),
    ),*/
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
  ];
}