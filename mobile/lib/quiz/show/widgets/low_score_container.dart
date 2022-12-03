import 'package:flutter/material.dart';

class LowScoreContainer extends StatelessWidget {

  final String score;

  const LowScoreContainer({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/low_score.png',
            width: 150,
            height: 150,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            score,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 36,
              color: Color(0xFFFF133E),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Text(
          'Oj!\nNie przejmuj się, następnym razem będzie lepiej!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFFFF133E),
          ),
        ),
      ],
    );
  }


}