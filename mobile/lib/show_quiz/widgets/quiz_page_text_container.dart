import 'package:flutter/material.dart';

class QuizPageTestContainer extends StatelessWidget {

  final String text;
  final String value;

  const QuizPageTestContainer(this.text, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Text(
            text, style: const TextStyle(fontSize: 20),
          ),
          Text(
            value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

}