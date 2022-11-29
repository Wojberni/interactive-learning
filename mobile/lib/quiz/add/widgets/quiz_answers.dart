import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/quiz/add/provider/add_quiz_provider.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/quiz_button.dart';
import '../widgets/custom_form_field.dart';
import 'answer_carousel.dart';

class QuizAnswers extends StatefulWidget {
  const QuizAnswers({super.key});

  @override
  State<QuizAnswers> createState() => _QuizAnswersState();
}

class _QuizAnswersState extends State<QuizAnswers> {
  final _formKey = GlobalKey<FormState>();
  var rightAnswer = 0;
  var _question = "";
  var _answer1 = "";
  var _answer2 = "";
  var _answer3 = "";
  var _answer4 = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomFormField(
            hintText: 'Pytanie',
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
            validator: (value) => validateQuestion(value),
          ),
          CustomFormField(
            hintText: 'Odpowiedź 1',
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
            validator: (value) => validateAnswerOne(value),
          ),
          CustomFormField(
            hintText: 'Odpowiedź 2',
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
            validator: (value) => validateAnswerTwo(value),
          ),
          CustomFormField(
            hintText: 'Odpowiedź 3',
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
            validator: (value) => validateAnswerThree(value),
          ),
          CustomFormField(
            hintText: 'Odpowiedź 4',
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
            validator: (value) => validateAnswerFour(value),
          ),
          const AnswerCarousel(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: QuizButton(
              title: 'Dodaj pytanie',
              onPressed: () => handleAddQuestion(),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: QuizButton(
              title: 'Zapisz quiz',
              onPressed: () => context.read<AddQuizProvider>().addQuiz(context),
            ),
          ),
        ],
      ),
    );
  }

  void handleAddQuestion(){
    if (!_formKey.currentState!.validate()) {
      return;
    }
    context.read<AddQuizProvider>().addQuestion(
        _question,
        [_answer1, _answer2, _answer3, _answer4],
        rightAnswer);

  }

  String? validateQuestion(String? value) {
    if (value!.isEmpty) {
      return "Pole nie może być puste!";
    } else {
      _question = value;
      return null;
    }
  }

  String? validateAnswerOne(String? value) {
    if (value!.isEmpty) {
      return "Pole nie może być puste!";
    } else {
      _answer1 = value;
      return null;
    }
  }

  String? validateAnswerTwo(String? value) {
    if (value!.isEmpty) {
      return "Pole nie może być puste!";
    } else {
      _answer2 = value;
      return null;
    }
  }

  String? validateAnswerThree(String? value) {
    if (value!.isEmpty) {
      return "Pole nie może być puste!";
    } else {
      _answer3 = value;
      return null;
    }
  }

  String? validateAnswerFour(String? value) {
    if (value!.isEmpty) {
      return "Pole nie może być puste!";
    } else {
      _answer4 = value;
      return null;
    }
  }
}
