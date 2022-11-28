import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/quiz_button.dart';
import '../widgets/quiz_header.dart';
import '../widgets/custom_form_field.dart';

class AddQuizAnswers extends StatefulWidget {
  const AddQuizAnswers({super.key});

  @override
  State<AddQuizAnswers> createState() => _AddQuizAnswersState();
}

class _AddQuizAnswersState extends State<AddQuizAnswers>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const AddQuizHeader(),
                CustomFormField(
                  hintText: 'Pytanie',
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                ),
                CustomFormField(
                  hintText: 'Odpowiedź 1',
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                ),
                CustomFormField(
                  hintText: 'Odpowiedź 2',
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                ),
                CustomFormField(
                  hintText: 'Odpowiedź 3',
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                ),CustomFormField(
                  hintText: 'Odpowiedź 4',
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: QuizButton(
                    title: 'Dodaj pytanie',
                    onPressed: () => context.go('/search/add_quiz'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: QuizButton(
                    title: 'Zapisz quiz',
                    onPressed: () => context.go('/home'),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}