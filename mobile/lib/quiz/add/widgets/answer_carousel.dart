import 'package:flutter/material.dart';
import 'package:mobile/quiz/add/widgets/answer_nr_container.dart';

class AnswerCarousel extends StatelessWidget {
  const AnswerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          AnswerNrContainer(answerNr: 1, isSelected: true, onAnswerNrSelected: () => print('1')),
          AnswerNrContainer(answerNr: 1, isSelected: true, onAnswerNrSelected: () => print('2')),
          AnswerNrContainer(answerNr: 1, isSelected: true, onAnswerNrSelected: () => print('3')),
          AnswerNrContainer(answerNr: 1, isSelected: true, onAnswerNrSelected: () => print('4')),
        ],
    );
  }
}