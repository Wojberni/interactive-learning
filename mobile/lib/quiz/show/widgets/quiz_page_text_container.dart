import 'package:flutter/material.dart';

class QuizPageTextContainer extends StatelessWidget {

  final String text;
  final String value;

  const QuizPageTextContainer(this.text, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        children: [
          Text(
            text, style: const TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

}