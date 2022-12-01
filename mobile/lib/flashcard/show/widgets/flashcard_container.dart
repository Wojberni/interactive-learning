import 'package:flutter/material.dart';
import 'package:mobile/flashcard/show/widgets/flashcard_content.dart';
import 'package:flip_card/flip_card.dart';

class FlashcardContainer extends StatelessWidget {
  final String questionText;
  final String answerText;
  const FlashcardContainer(this.questionText, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.only(
          left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: const Color(0x00000000),
      child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 2000,
          onFlipDone: (status) {
            print(status ? "Answer" : "Question");
          },
          front: FlashcardContent(false, questionText),
          back: FlashcardContent(true, answerText)),
    );}
}
