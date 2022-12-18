import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/providers/item_list_provider.dart';
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
              padding: const EdgeInsets.all(20),
              child: Text(
                _setDescription(context),
                style:
                    const TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
              ),
            ),
            QuizPageTextContainer(
                'Procent ukończenia', _setPercentage(context)),
            QuizPageTextContainer('Twórca quizu', _setAuthor(context)),
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
                  _setHeart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _setTitle(BuildContext context) {
    if (id == 'daily_challenge') {
      return 'Dzienne wyzwanie';
    } else {
      return context
          .read<ItemListProvider>()
          .filteredItems
          .results[int.parse(id)]
          .title;
    }
  }

  String _setDescription(BuildContext context) {
    if (id == 'daily_challenge') {
      return 'Dzienne wyzwanie to quiz, który jest losowany raz dziennie. '
          'Spróbuj odpowiedzieć na jak najwięcej pytań!';
    } else {
      return context
          .read<ItemListProvider>()
          .filteredItems
          .results[int.parse(id)]
          .description;
    }
  }

  String _setAuthor(BuildContext context) {
    if (id == 'daily_challenge') {
      return '?????';
    } else {
      return context
          .read<ItemListProvider>()
          .filteredItems
          .results[int.parse(id)]
          .author;
    }
  }

  String _setPercentage(BuildContext context) {
    if (id == 'daily_challenge') {
      return '??%';
    } else {
      return '${context.read<ItemListProvider>().filteredItems.results[int.parse(id)].successRate}%';
    }
  }

  _setHeart() {
    if (id == 'daily_challenge') {
      return const Visibility(
          visible: false, child: HeartFavourite(isFavourite: true));
    } else {
      return const HeartFavourite(isFavourite: true);
    }
  }
}
