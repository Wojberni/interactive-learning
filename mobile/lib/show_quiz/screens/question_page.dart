import 'package:flutter/material.dart';
import 'package:mobile/show_quiz/widgets/header_quiz_page.dart';
import 'package:mobile/show_quiz/widgets/quiz_answer.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const HeaderQuizPage(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: const Text(
                "Who was the first president of the United States?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
            ),
            const QuizAnswer("This is the answer A", "assets/images/letter-a.png",
                Color(0xFF38FE40), false),
            const QuizAnswer("This is the answer B", "assets/images/letter-b.png",
                Color(0xFF2E6CF0), true),
            const QuizAnswer("This is the answer C", "assets/images/letter-c.png",
                Color(0xFFF0AA0A), false),
            const QuizAnswer("This is the answer D", "assets/images/letter-d.png",
                Color(0xFFF02E83), false),
          ],
        ),
      ),
    );
  }
}
