import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Text('Name of quiz', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            const Text('This will be a description of the quiz', style: TextStyle(fontSize: 26),),
            const Text('This quiz has 10 questions', style: TextStyle(fontSize: 26, ),),
            Row(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => context.go('/random_task/question/'),
                    child: const Center(child: Text('Start Quiz'))),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () => context.go('/home'),
                    child: const Center(child: Text('Back'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
