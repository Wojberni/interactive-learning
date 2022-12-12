import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/common/helpers/snackbar.dart';
import 'package:mobile/flashcard/add/models/flashcard_model.dart';
import 'package:mobile/quiz/common/widgets/quiz_button.dart';

import '../widgets/header_add_flashcard.dart';
import '../../../quiz/add/widgets/custom_form_field.dart';

class AddFlashcardPage extends StatefulWidget {
  const AddFlashcardPage({super.key});

  @override
  State<AddFlashcardPage> createState() => _AddFlashcardPageState();
}

class _AddFlashcardPageState extends State<AddFlashcardPage> {
  final _formKey = GlobalKey<FormState>();
  var question = "";
  var answer = "";

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
                LengthLimitingTextInputFormatter(100),
              ],
              validator: (value) => validateQuestion(value),
            ),
            CustomFormField(
              hintText: 'Odpowiedź',
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
              validator: (value) => validateAnswer(value),
            ),
            QuizButton(
              title: 'Dodaj fiszkę',
              onPressed: () => {
                if (handleValidation()) {
                  addFlashcard(),
                }
              }
            )
          ],
        ),
      )),
    );
  }

  void addFlashcard() {
    FlashcardModel model = FlashcardModel(question: question, answer: answer);
    Map<String, dynamic> flashcardJson = model.toJson();
    CreateFlashcardRequest? request =
        CreateFlashcardRequest.fromJson(flashcardJson);
    if (request == null) {
      return;
    }
    FlashcardEndpointApi(apiClient)
        .createFlashcard(request)
        .then((value) => {
              showSnackBar(context, "Dodano fiszkę!", SnackBarType.success),
              context.go('/'),
            })
        .catchError((error) => {
              showSnackBar(context, "Błąd serwera!", SnackBarType.error),
            });
  }

  bool handleValidation() {
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    return true;
  }

  String? validateQuestion(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pole nie może być puste';
    }
    question = value;
    return null;
  }

  String? validateAnswer(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pole nie może być puste';
    }
    answer = value;
    return null;
  }
}
