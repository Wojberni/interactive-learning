import 'package:flutter/material.dart';
import 'package:mobile/quiz/add/provider/add_quiz_provider.dart';
import 'package:provider/provider.dart';

class AnswerNrContainer extends StatelessWidget {
  final int answerNr;

  final _firstColor = const Color(0xFFFFB1B6);

  const AnswerNrContainer({super.key, required this.answerNr});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AddQuizProvider>().setAnswerNr(answerNr),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: context.watch<AddQuizProvider>().correctAnswer == answerNr
              ? Colors.green
              : _firstColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            answerNr.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
