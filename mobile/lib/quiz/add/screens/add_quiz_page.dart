import 'package:flutter/material.dart';
import 'package:mobile/quiz/add/provider/add_quiz_provider.dart';
import 'package:mobile/quiz/add/widgets/quiz_answers.dart';
import 'package:provider/provider.dart';

import '../widgets/quiz_header.dart';
import '../widgets/quiz_page.dart';

class AddQuizPage extends StatefulWidget {
  const AddQuizPage({super.key});

  @override
  State<AddQuizPage> createState() => _AddQuizPageState();
}

class _AddQuizPageState extends State<AddQuizPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddQuizProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Consumer<AddQuizProvider>(builder: (context, provider, child) {
            return ListView(
              children: [
                const AddQuizHeader(),
                provider.addQuestions == false
                    ? const QuizPage()
                    : const QuizAnswers(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
