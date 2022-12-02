import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/header_quiz_page.dart';
import '../widgets/heart_favourite.dart';
import '../../common/widgets/quiz_button.dart';
import '../widgets/quiz_page_text_container.dart';


class QuizPage extends StatelessWidget {

  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const HeaderQuizPage(),
            const Text(
              'Daily Challenge',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                'This is your daily challenge. ',
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
              ),
            ),
            const QuizPageTestContainer('Liczba pytań', '10'),
            const QuizPageTestContainer('Success rate', '60%'),
            const QuizPageTestContainer('Twórca quizu', 'xxx'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                QuizButton(
                  title: 'Start',
                  onPressed: () => context.go('/daily_challenge/question/'),
                ),
                // const HeartFavourite(isFavourite: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
