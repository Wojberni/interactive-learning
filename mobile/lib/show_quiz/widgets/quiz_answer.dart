import 'package:flutter/material.dart';

class QuizAnswer extends StatelessWidget {
  final String answerText;
  final String imagePath;
  final Color backgroundColor;

  const QuizAnswer(this.answerText, this.imagePath, this.backgroundColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Row(
        children: [
          Image.asset(imagePath),
          Text(answerText),
        ],
      ),
    );
  }
}