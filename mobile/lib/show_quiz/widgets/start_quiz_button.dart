import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartQuizButton extends StatelessWidget {
  const StartQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: Colors.black)
              )
          ),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
        backgroundColor: const MaterialStatePropertyAll(Color(0xFFECECEC)),
      ),
      onPressed: () => context.go('/random_task/question/'),
      child: const Center(
        child: Text('Start Quiz',
            style: TextStyle(fontSize: 24, color: Colors.black)),
      ),
    );
  }
}
