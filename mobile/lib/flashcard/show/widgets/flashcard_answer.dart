import 'package:flutter/material.dart';

class FlashcardAnswer extends StatelessWidget {
  final String answerText;
  const FlashcardAnswer(this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(240, 254, 183, 102),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Image.asset('assets/images/answer.png',
                  width: 150, height: 150),
            )
          ),
          Expanded(
            flex: 6,
            child: Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  answerText,
                  style: const TextStyle(fontSize: 40),
                  selectionColor: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
