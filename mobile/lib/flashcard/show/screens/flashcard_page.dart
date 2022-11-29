import '../widgets/flashcard_answer.dart';
import '../widgets/flashcard_question.dart';
import '../widgets/header_flashcard.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashcardPage extends StatefulWidget {
  const FlashcardPage({super.key});

  @override
  State<FlashcardPage> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  String question = "Question";
  String answer = "Answer";
  _renderContent(context, question, answer) {
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
          front: FlashcardQuestion(question),
          back: FlashcardAnswer(answer)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const HeaderFlashcard(),
                    Expanded(
                      flex: 6,
                      child: _renderContent(context, question, answer),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                )
          ],
        ),
    )));
  }
}
