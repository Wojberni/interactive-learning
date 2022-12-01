import 'package:flutter/material.dart';

class FlashcardContent extends StatelessWidget {
  final bool isFlipped;
  final String text;
  const FlashcardContent(this.isFlipped, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    Image headerImage;
    Color bgColor;
    if (isFlipped) {
      // Flipcard is on the side with an answer
      bgColor = const Color.fromARGB(255, 255, 212, 22);
      headerImage = Image.asset('assets/images/answer.png',
          width: 150, height: 150);
    }
    else {
      // Flipcard is on the side with a question
      bgColor = const Color.fromARGB(240, 254, 183, 102);
      headerImage = Image.asset('assets/images/question.png',
          width: 150, height: 150);
    }


    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: headerImage,
              )),
          Expanded(
              flex: 6,
              child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 40),
                    selectionColor: Colors.white,
                  )))
        ],
      ),
    );
  }
}
