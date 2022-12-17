import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/flashcard/show/screens/flashcard_page.dart';
import 'package:mobile/friends/screens/friends_page.dart';
import 'package:mobile/profile/screens/profile_page.dart';
import 'package:mobile/quiz/add/screens/add_quiz_page.dart';
import 'package:mobile/search_engine/screens/search_screen.dart';

import '../choose_method/screens/choose_method_page.dart';
import '../flashcard/add/screens/flashcard_add.dart';
import '../friends/screens/requests_page.dart';
import '../home/screens/home_page.dart';
import '../login_register/screens/login_page.dart';
import '../login_register/screens/registration_page.dart';
import '../quiz/show/screens/question_page.dart';
import '../quiz/show/screens/quiz_page.dart';

List<GoRoute> myRoutes() {
  return [
    GoRoute(
      path: '/auth/login',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    GoRoute(
      path: '/auth/register',
      name: 'register',
      builder: (BuildContext context, GoRouterState state) =>
          const RegistrationPage(),
    ),
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: '/daily_challenge',
      name: 'daily_challenge',
      builder: (BuildContext context, GoRouterState state) => const QuizPage(),
    ),
    GoRoute(
      path: '/daily_challenge/question',
      name: 'daily_challenge_question',
      builder: (BuildContext context, GoRouterState state) =>
          const QuestionPage(),
    ),
    GoRoute(
      path: '/random_task',
      name: 'random_task',
      builder: (BuildContext context, GoRouterState state) =>
          const FlashcardPage(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (BuildContext context, GoRouterState state) =>
          const ProfilePage(),
    ),
    GoRoute(
      path: '/search',
      name: 'search',
      builder: (BuildContext context, GoRouterState state) =>
          const SearchScreenPage(),
    ),
    GoRoute(
      path: '/add',
      name: 'choose_method',
      builder: (BuildContext context, GoRouterState state) =>
          const ChooseMethodPage(),
      routes: [
        GoRoute(
          path: 'quiz',
          name: 'add_quiz',
          builder: (BuildContext context, GoRouterState state) =>
              const AddQuizPage(),
        ),
        GoRoute(
          path: 'flashcard',
          name: 'add_flashcard',
          builder: (BuildContext context, GoRouterState state) =>
              const AddFlashcardPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/friends',
      name: 'friends',
      builder: (BuildContext context, GoRouterState state) =>
          const FriendsPage(),
      routes: [
        GoRoute(
          path: 'requests',
          name: 'friend_requests',
          builder: (BuildContext context, GoRouterState state) =>
              const RequestsPage(),
        ),
      ],
    ),
  ];
}
