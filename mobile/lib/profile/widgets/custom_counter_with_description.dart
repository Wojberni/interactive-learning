import 'package:flutter/material.dart';

class CustomCounterWithDescription extends StatelessWidget {
  const CustomCounterWithDescription({
    Key? key,
    required this.text,
    required this.description,
  }) : super(key: key);

  final String text;
  final String description;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.02),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 36, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
