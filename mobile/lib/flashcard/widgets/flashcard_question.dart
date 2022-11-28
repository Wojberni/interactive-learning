import 'package:flutter/material.dart';

class FlashcardQuestion extends StatelessWidget {
  final String questionText;
  const FlashcardQuestion(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 212, 22),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset('assets/images/question.png',
                  width: 150, height: 150),
            )
          ),
          Expanded(
              flex: 6,
              child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    questionText,
                    style: const TextStyle(fontSize: 40),
                    selectionColor: Colors.white,
                  )))
        ],
      ),
    );
  }
}
