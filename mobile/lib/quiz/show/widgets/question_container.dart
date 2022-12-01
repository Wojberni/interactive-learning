import 'package:flutter/material.dart';

class QuestionContainer extends StatelessWidget {
  final String question;

  const QuestionContainer({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        question,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
