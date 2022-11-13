import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/show_quiz/widgets/header_quiz_page.dart';
import 'package:mobile/show_quiz/widgets/quiz_page_text_container.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

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
                'This will be a description of the quiz',
                style: TextStyle(fontSize: 26, fontStyle: FontStyle.italic),
              ),
            ),
            const QuizPageTestContainer('Liczba pytań', '10'),
            const QuizPageTestContainer('Success rate', '60%'),
            const QuizPageTestContainer('Twórca quizu', 'xxx'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20))),
                    onPressed: () => context.go('/random_task/question/'),
                    child: const Center(child: Text('Start Quiz'))),
                ElevatedButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20))),
                    onPressed: () => print('Added to favourites object'),
                    child: const Center(child: Text('Make favourite'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
