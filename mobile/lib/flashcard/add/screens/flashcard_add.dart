import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/helpers/snackbar.dart';
import 'package:mobile/quiz/common/widgets/quiz_button.dart';

import '../widgets/header_add_flashcard.dart';
import '../../../quiz/add/widgets/custom_form_field.dart';

class AddFlashcardPage extends StatefulWidget {
  const AddFlashcardPage({super.key});

  @override
  State<AddFlashcardPage> createState() => _AddQuizPageState();
}

class _AddQuizPageState extends State<AddFlashcardPage>{
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const HeaderAddFlashcard(),
                CustomFormField(
                  hintText: 'Pytanie',
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(150),
                  ],
                  validator: (value) => validateInput(value),
                ),
                CustomFormField(
                  hintText: 'Odpowiedź',
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(150),
                  ],
                  validator: (value) => validateInput(value),
                ),
                QuizButton(
                  title: 'Dodaj fiszkę',
                  onPressed: () => {
                    showSnackBar(context, "Dodano fiszkę", SnackBarType.info),
                    context.go('/home'),
                  }
                )
              ],
            ),
          )
      ),
    );
  }

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pole nie może być puste';
    }
    return null;
  }

}