import 'package:flutter/material.dart';

class NumberOfPointsTile extends StatelessWidget {
  const NumberOfPointsTile({super.key, required this.numOfPoints});

  final int numOfPoints;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Chip(
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.deepPurple,
        label: Text(
          "$numOfPoints pkt.",
          textAlign: TextAlign.right,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}