import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/custom_navigation_bar.dart';
import 'package:mobile/common/widgets/navigation_bar_selection.dart';

import '../widgets/choose_method_header.dart';
import '../widgets/learning_method.dart';

class ChooseMethodPage extends StatelessWidget {
  const ChooseMethodPage({super.key});

  final String _quizDescription =
      "Kilka pytań pod rząd. Pytanie ma kilka odpowiedzi do wyboru.";
  final String _quizImagePath = 'assets/images/quiz.png';
  final String _flashcardDescription = 'Jedno pytanie, jedna odpowiedź.';
  final String _flashcardImagePath = 'assets/images/flash-cards.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView(
                children: [
                  const ChooseMethodHeader(),
                  LearningMethod(
                    name: 'Quiz',
                    description: _quizDescription,
                    imagePath: _quizImagePath,
                  ),
                  LearningMethod(
                    name: 'Fiszka',
                    description: _flashcardDescription,
                    imagePath: _flashcardImagePath,
                  ),
                ],
              ),
            ),
            const CustomNavigationBar(selectedIndex: NavigationBarSelection.home),
          ]
        ),
      ),
    );
  }
}
