import 'package:flutter/material.dart';
import 'package:mobile/quiz/show/provider/show_quiz_provider.dart';

class WrongAnswerContainer extends StatelessWidget {
  const WrongAnswerContainer({Key? key, required this.provider})
      : super(key: key);

  final ShowQuizProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/wrong_answer.png',
            width: 100,
            height: 100,
          ),
          const Text(
            'Ups!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Odpowiedż jest nieprawidłowa!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFFFF1313),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Prawidłowa odpowiedź to:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Text(
            provider
                .question.answers[provider.userQuizData.correctAnswer].content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
