import 'package:flutter/material.dart';
import 'package:learning_api/api.dart';
import 'package:mobile/api/ApiClient.dart';
import 'package:mobile/quiz/show/provider/show_quiz_provider.dart';
import 'package:mobile/quiz/show/widgets/answer_container.dart';
import 'package:provider/provider.dart';

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
                context.read<ShowQuizProvider>().quiz = quiz!;
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

  _listView(ShowQuizProvider provider) {
    ListView(
      children: <Widget>[
        const HeaderQuizPage(),
        QuestionContainer(question: provider.question.content),
        AnswerContainer(containerIndex: 0, provider: provider),
        AnswerContainer(containerIndex: 1, provider: provider),
        AnswerContainer(containerIndex: 2, provider: provider),
        AnswerContainer(containerIndex: 3, provider: provider),
      ],);
  }


  Future<QuizDto?> _getQuiz(BuildContext context) async {
    QuizDetailsResponse? response = await QuizEndpointApi(apiClient).getDailyChallenge();
    if(response != null){
      return QuizDto.fromJson(response.toJson());
    }
    return null;
  }
}
