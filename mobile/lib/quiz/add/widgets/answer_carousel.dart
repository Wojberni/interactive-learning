import 'package:flutter/material.dart';
import 'package:mobile/quiz/add/widgets/answer_nr_container.dart';

class AnswerCarousel extends StatelessWidget {
  const AnswerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            AnswerNrContainer(answerNr: 1),
            AnswerNrContainer(answerNr: 2),
            AnswerNrContainer(answerNr: 3),
            AnswerNrContainer(answerNr: 4),
          ],
      ),
    );
  }
}