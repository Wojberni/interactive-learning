import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

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
      onPressed: onPressed,
      child: Center(
        child:
            Text(title, style: const TextStyle(fontSize: 24, color: Colors.blue)),
      ),
    );
  }
}
