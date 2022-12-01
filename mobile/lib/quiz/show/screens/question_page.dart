import 'package:flutter/material.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/quiz/show/provider/show_quiz_provider.dart';
import 'package:mobile/quiz/show/widgets/answer_container.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../model/quiz_dto.dart';
import '../widgets/header_quiz_page.dart';
import '../widgets/question_container.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShowQuizProvider(),
      child: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
            future: _getQuiz(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                QuizDto? quiz = snapshot.data;
                ShowQuizProvider provider = context.read<ShowQuizProvider>();
                if(quiz != null){
                  provider.quiz = quiz;
                  provider.question = quiz.questions[provider.currentQuestion];
                }
                return Consumer<ShowQuizProvider>(
                  builder: (context, provider, child) => _listView(provider),
                );
              }
              else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _listView(ShowQuizProvider provider) {
    return ListView(
      children: <Widget>[
        const HeaderQuizPage(),
        QuestionContainer(question: provider.question.content),
        for (int i = 0; i < provider.question.answers.length; i++)
          AnswerContainer(containerIndex: i, provider: provider)
      ],);
  }


  Future<QuizDto?> _getQuiz(BuildContext context) async {
    QuizDetailsResponse? response = await QuizEndpointApi(apiClient).getDailyChallenge();
    if(response != null){
      Map<String, dynamic> json = jsonDecode(jsonEncode(response));
      return QuizDto.fromJson(json);
    }
    return null;
  }
}
