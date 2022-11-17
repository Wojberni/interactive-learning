import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartQuizButton extends StatelessWidget {
  const StartQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all<Color>(Colors.blue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        )),
        padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 20, horizontal: 50)),
        backgroundColor: const MaterialStatePropertyAll(Color(0xFFECECEC)),
      ),
      onPressed: () => context.go('/random_task/question/'),
      child: const Center(
        child:
            Text('Start', style: TextStyle(fontSize: 24, color: Colors.blue)),
      ),
    );
  }
}
