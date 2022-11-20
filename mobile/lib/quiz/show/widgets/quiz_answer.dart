import 'package:flutter/material.dart';

class QuizAnswer extends StatelessWidget {
  final String answerText;
  final String imagePath;
  final Color backgroundColor;
  final bool isCorrect;

  const QuizAnswer(this.answerText, this.imagePath, this.backgroundColor, this.isCorrect,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () => print('Answer pressed is $isCorrect'),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  imagePath,
                  width: 25,
                  height: 25,
                ),
              ),
              Text(
                answerText,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
