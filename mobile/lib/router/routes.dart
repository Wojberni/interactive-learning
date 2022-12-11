import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/flashcard/show/screens/flashcard_page.dart';
import 'package:mobile/friends/screens/friends_page.dart';
import 'package:mobile/profile/screens/profile_page.dart';
import 'package:mobile/quiz/add/screens/add_quiz_page.dart';

import '../add/screens/choose_method.dart';
import '../flashcard/add/screens/flashcard_add.dart';
import '../friends/screens/requests_page.dart';
import '../home/screens/home_page.dart';
import '../login_register/screens/login_page.dart';
import '../login_register/screens/registration_page.dart';
import '../quiz/show/screens/question_page.dart';
import '../quiz/show/screens/quiz_page.dart';

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
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
      const HomePage(),
    ),
    GoRoute(
      path: '/daily_challenge', // temporary path
      builder: (BuildContext context, GoRouterState state) =>
      const QuizPage(),
    ),
    GoRoute(
      path: '/daily_challenge/question', // temporary path
      builder: (BuildContext context, GoRouterState state) =>
      const QuestionPage(),
    ),
    GoRoute(
      path: '/random_task', // temporary path
      builder: (BuildContext context, GoRouterState state) =>
      const FlashcardPage(1),
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) =>
      const ProfilePage(),
    ),
/*    GoRoute(
      path: '/search', // temporary path
      builder: (BuildContext context, GoRouterState state) =>
      const AddQuizPage(),
    ),*/
    GoRoute(
      path: '/add/quiz',
      builder: (BuildContext context, GoRouterState state) =>
      const AddQuizPage(),
    ),
    GoRoute(
      path: '/friends',
      builder: (BuildContext context, GoRouterState state) =>
      const FriendsPage(),
    ),
    GoRoute(
      path: '/requests',
      builder: (BuildContext context, GoRouterState state) =>
      const RequestsPage(),
    ),
    GoRoute(
      path: '/add',
      builder: (BuildContext context, GoRouterState state) =>
      const ChooseMethod(),
    ),
    GoRoute(
      path: '/add/flashcard',
      builder: (BuildContext context, GoRouterState state) =>
      const AddFlashcardPage(),
    )
  ];
}
