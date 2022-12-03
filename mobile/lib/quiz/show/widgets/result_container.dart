import 'package:flutter/material.dart';
import 'package:mobile/quiz/show/widgets/high_score_container.dart';

import '../provider/show_quiz_provider.dart';
import 'low_score_container.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({Key? key, required this.provider}) : super(key: key);

  final ShowQuizProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          const Text(
            'Koniec quizu!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Twój wynik to...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          _showScore(),
        ],
      ),
    );
  }

  Widget _showScore() {
    if (provider.userQuizData.userScore >= 50.0) {
      return HighScoreContainer(score: '${provider.userQuizData.userScore.toStringAsFixed(0)}%');
    } else {
      return LowScoreContainer(score: '${provider.userQuizData.userScore.toStringAsFixed(0)}%');
    }
  }
}
