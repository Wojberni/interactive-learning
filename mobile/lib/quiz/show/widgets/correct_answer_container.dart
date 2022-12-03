import 'package:flutter/material.dart';

class CorrectAnswerContainer extends StatelessWidget {
  const CorrectAnswerContainer({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/right_answer.png',
            width: 100,
            height: 100,
          ),
          const Text(
            'Brawo!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF50FF13),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Odpowiedż jest prawidłowa!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF50FF13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
