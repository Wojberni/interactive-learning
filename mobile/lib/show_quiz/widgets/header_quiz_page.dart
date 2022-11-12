import 'package:flutter/material.dart';

class HeaderQuizPage extends StatelessWidget {

  const HeaderQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/quiz.png'),
        const Text('Quiz'),
        Image.asset('assets/images/close.png'),
      ],
    );
  }
}