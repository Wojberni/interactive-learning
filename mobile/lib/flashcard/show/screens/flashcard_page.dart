import 'package:mobile/flashcard/show/widgets/flashcard_container.dart';

import '../widgets/header_flashcard.dart';
import 'package:flutter/material.dart';

class FlashcardPage extends StatefulWidget {
  const FlashcardPage({super.key});

  @override
  State<FlashcardPage> createState() => _FlashcardPageState();
}

class _FlashcardPageState extends State<FlashcardPage> {
  String question = "Question";
  String answer = "Answer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: FlashcardContainer(question, answer),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                )
          ],
        ),
    ));
  }
}
