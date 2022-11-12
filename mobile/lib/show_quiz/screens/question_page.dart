import 'package:flutter/material.dart';
import 'package:mobile/show_quiz/widgets/header_quiz_page.dart';
import 'package:mobile/show_quiz/widgets/quiz_answer.dart';

class ShowQuestion extends StatelessWidget {

  const ShowQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          HeaderQuizPage(),
          Text("Who was the first president of the United States?"),
          QuizAnswer("This is the answer A", "assets/images/letter-a.png", Color(0xFF38FE40)),
          QuizAnswer("This is the answer B", "assets/images/letter-b.png", Color(0xFF2E6CF0)),
          QuizAnswer("This is the answer C", "assets/images/letter-c.png", Color(0xFFF0AA0A)),
          QuizAnswer("This is the answer D", "assets/images/letter-d.png", Color(0xFFF02E83)),
        ],
      ),
    );
  }
}