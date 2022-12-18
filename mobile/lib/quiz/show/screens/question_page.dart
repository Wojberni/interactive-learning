import 'package:flutter/material.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/common/providers/item_list_provider.dart';
import 'package:mobile/quiz/show/provider/show_quiz_provider.dart';
import 'package:mobile/quiz/show/widgets/answer_container.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '../model/quiz_dto.dart';
import '../widgets/correct_answer_container.dart';
import '../widgets/header_quiz_page.dart';
import '../widgets/question_container.dart';
import '../widgets/quiz_title_container.dart';
import '../widgets/result_container.dart';
import '../widgets/wrong_answer_container.dart';

class QuestionPage extends StatelessWidget {
  final String id;

  const QuestionPage({super.key, required this.id});

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
                if (quiz != null) {
                  provider.quiz = quiz;
                  provider.question =
                      quiz.questions[provider.userQuizData.currentQuestion];
                }
                return Consumer<ShowQuizProvider>(
                  builder: (context, provider, child) =>
                      _listView(context, provider),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
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

  Widget _listView(BuildContext context, ShowQuizProvider provider) {
    return ListView(
      children: <Widget>[
        const HeaderQuizPage(),
        QuizTitleContainer(title: _setTitleQuiz(context)),
        _showCurrentWidget(context, provider),
      ],
    );
  }

  Widget _showCurrentWidget(BuildContext context, ShowQuizProvider provider) {
    switch (provider.userQuizData.status) {
      case QuizShowStatus.question:
        return _showQuestion(provider);
      case QuizShowStatus.answer:
        return _showAnswer(provider);
      case QuizShowStatus.result:
        provider.sendResult();
        return _showResult(provider);
    }
  }

  Widget _showQuestion(ShowQuizProvider provider) {
    return Column(children: [
      QuestionContainer(question: provider.question.content),
      for (int i = 0; i < provider.question.answers.length; i++)
        AnswerContainer(containerIndex: i, provider: provider)
    ]);
  }

  Widget _showAnswer(ShowQuizProvider provider) {
    if (provider.userQuizData.userCorrectAnswered) {
      return GestureDetector(
        onTap: () => provider.nextQuestion(),
        child: Column(children: [
          QuestionContainer(question: provider.question.content),
          AnswerContainer(
              containerIndex: provider.userQuizData.currentAnswer,
              provider: provider),
          const CorrectAnswerContainer(),
        ]),
      );
    } else {
      return GestureDetector(
        onTap: () => provider.nextQuestion(),
        child: Column(children: [
          QuestionContainer(question: provider.question.content),
          AnswerContainer(
              containerIndex: provider.userQuizData.currentAnswer,
              provider: provider),
          WrongAnswerContainer(provider: provider),
        ]),
      );
    }
  }

  Widget _showResult(ShowQuizProvider provider) {
    return ResultContainer(
      provider: provider,
    );
  }

  Future<QuizDto?> _getQuiz(BuildContext context) async {
    QuizDetailsResponse? response;
    if (id == 'daily_challenge'){
      response = await QuizEndpointApi(apiClient).getDailyChallenge();
    }
    else{
      final int quizId = context
          .read<ItemListProvider>()
          .filteredItems
          .results[int.parse(id)]
          .id;
      response = await QuizEndpointApi(apiClient).getQuizById(quizId);
    }
    if (response != null) {
      Map<String, dynamic> json = jsonDecode(jsonEncode(response));
      return QuizDto.fromJson(json);
    }
    return null;
  }

  String _setTitleQuiz(BuildContext context){
    if (id == 'daily_challenge'){
      return 'Dzienne wyzwanie';
    }
    else{
      return context
          .read<ItemListProvider>()
          .filteredItems
          .results[int.parse(id)]
          .title;
    }
  }
}
