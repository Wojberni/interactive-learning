import 'package:flutter/material.dart';
import 'package:mobile/show_quiz/widgets/header_quiz_page.dart';
import 'package:mobile/show_quiz/widgets/heart_favourite.dart';
import 'package:mobile/show_quiz/widgets/quiz_page_text_container.dart';
import 'package:mobile/show_quiz/widgets/start_quiz_button.dart';

class QuizPage extends StatefulWidget {
  QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const HeaderQuizPage(),
            const Text(
              'Name of quiz',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                'This will be a description of the quiz. ',
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
              ),
            ),
            const QuizPageTestContainer('Liczba pytań', '10'),
            const QuizPageTestContainer('Success rate', '60%'),
            const QuizPageTestContainer('Twórca quizu', 'xxx'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                StartQuizButton(),
                HeartFavourite(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
