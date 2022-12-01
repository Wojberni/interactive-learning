import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/quiz/add/provider/add_quiz_provider.dart';
import 'package:mobile/quiz/common/widgets/quiz_button.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_form_field.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _formKey = GlobalKey<FormState>();
  var _title = "";
  var _description = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormField(
            hintText: 'Tytuł quizu',
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
            validator: (value) => validateTitle(value),
          ),
          CustomFormField(
            hintText: 'Opis',
            inputFormatters: [
              LengthLimitingTextInputFormatter(100),
            ],
            validator: (value) => validateDescription(value),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: QuizButton(
              title: 'Dodaj quiz',
              onPressed: () => handleAddQuizTitleAndDescription(),
            ),
          )
        ],
      ),
    );
  }

  void handleAddQuizTitleAndDescription() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    context.read<AddQuizProvider>().addQuizTitleAndDescription(context, _title, _description);
  }

  String? validateTitle(String? value) {
    if (value!.isEmpty) {
      return "Pole nie może być puste!";
    } else {
      _title = value;
      return null;
    }
  }

  String? validateDescription(String? value) {
    if (value!.isEmpty) {
      return "Pole nie może być puste!";
    } else {
      _description = value;
      return null;
    }
  }
}
