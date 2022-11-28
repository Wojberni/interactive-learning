import 'package:flutter/material.dart';

class AnswerNrContainer extends StatelessWidget {
  final int answerNr;
  final bool isSelected;
  final VoidCallback onAnswerNrSelected;

  final _firstColor = const Color(0xFFFFB1B6);

  const AnswerNrContainer({super.key, required this.answerNr, required this.isSelected, required this.onAnswerNrSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onAnswerNrSelected,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : _firstColor,
          borderRadius: BorderRadius.circular(20),
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