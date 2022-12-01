import 'package:flutter/material.dart';
import 'package:mobile/quiz/show/provider/show_quiz_provider.dart';

class AnswerContainer extends StatelessWidget {
  final int containerIndex;
  final ShowQuizProvider provider;

  const AnswerContainer({
    required this.containerIndex,
    required this.provider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () => _checkAnswer(),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
          decoration: BoxDecoration(
            color: _setBackgroundColor(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  _setImagePath(),
                  width: 25,
                  height: 25,
                ),
              ),
              Text(
                provider.question.answers[containerIndex].content,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkAnswer(){
    provider.showAnswers(containerIndex);
    provider.nextQuestion();
  }

  Color _setBackgroundColor() {
    Color backgroundColor;
    switch (containerIndex) {
      case 0:
        backgroundColor = const Color(0xFF38FE40);
        break;
      case 1:
        backgroundColor = const Color(0xFF2E6CF0);
        break;
      case 2:
        backgroundColor = const Color(0xFFE5E5E5);
        break;
      case 3:
        backgroundColor = const Color(0xFFF0AA0A);
        break;
      default:
        backgroundColor = const Color(0xFFFFFFFF);
    }
    return backgroundColor;
  }

  String _setImagePath() {
    String imagePath;
    switch (containerIndex) {
      case 0:
        imagePath = "assets/images/letter-a.png";
        break;
      case 1:
        imagePath = "assets/images/letter-b.png";
        break;
      case 2:
        imagePath = "assets/images/letter-c.png";
        break;
      case 3:
        imagePath = "assets/images/letter-d.png";
        break;
      default:
        imagePath = "";
    }
    return imagePath;
  }
}
