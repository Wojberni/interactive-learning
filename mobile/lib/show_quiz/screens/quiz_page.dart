import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {

  const QuizPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const <Widget>[
            Text('Name of quiz'),
            Text('This will be a description of the quiz'),
          ],
        ),
      ),
    );
  }
}