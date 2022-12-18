import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/providers/search_quiz_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/header_quiz_page.dart';
import '../widgets/heart_favourite.dart';
import '../../common/widgets/quiz_button.dart';
import '../widgets/quiz_page_text_container.dart';

class QuizPage extends StatelessWidget {
  final String id;

  const QuizPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const HeaderQuizPage(),
            Text(
              _setTitle(context),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                _setDescription(context),
                style:
                    const TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
              ),
            ),
            const QuizPageTestContainer('Liczba pytań', '10'),
            const QuizPageTestContainer('Success rate', '60%'),
            const QuizPageTestContainer('Twórca quizu', 'xxx'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  QuizButton(
                    title: 'Start',
                    onPressed: () => context
                        .goNamed('show_quiz_questions', params: {'id': id}),
                  ),
                  const HeartFavourite(isFavourite: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _setTitle(BuildContext context){
    if (id == 'daily_challenge'){
      return 'Dzienne wyzwanie';
    } else {
      return context
          .read<SearchScreenProvider>()
          .filteredItems
          .results[int.parse(id)]
          .title;
    }
  }

  String _setDescription(BuildContext context){
    if (id == 'daily_challenge'){
      return 'Dzienne wyzwanie to quiz, który jest losowany raz dziennie. Spróbuj odpowiedzieć na jak najwięcej pytań!';
    } else {
      return context
          .read<SearchScreenProvider>()
          .filteredItems
          .results[int.parse(id)]
          .description;
    }
  }
}
