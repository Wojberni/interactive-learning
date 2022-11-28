import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/quiz/common/widgets/quiz_button.dart';

import '../widgets/quiz_header.dart';
import '../widgets/custom_form_field.dart';

class AddQuizPage extends StatefulWidget {
  const AddQuizPage({super.key});

  @override
  State<AddQuizPage> createState() => _AddQuizPageState();
}

class _AddQuizPageState extends State<AddQuizPage>{
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
                hintText: 'Tytuł quizu',
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
              ),
              CustomFormField(
                hintText: 'Opis',
                inputFormatters: [
                  LengthLimitingTextInputFormatter(100),
                ],
              ),
              QuizButton(
                  title: 'Dodaj quiz',
                  onPressed: () => context.go('/search/add_quiz'),
              )
            ],
          ),
        )
      ),
    );
  }
}