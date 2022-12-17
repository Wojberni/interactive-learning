import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LearningMethod extends StatelessWidget {
  const LearningMethod({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
  });

  final String name;
  final String description;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToClickedPath(context),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            border: Border.all(),
            color: const Color(0xFFECECEC),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(fontSize: 32),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(height: 1.5, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _goToClickedPath(BuildContext context) {
    if (name == "Quiz") {
      context.goNamed('add_quiz');
    } else if (name == "Fiszka") {
      context.goNamed('add_flashcard');
    }
  }
}
