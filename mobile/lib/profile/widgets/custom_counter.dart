import 'package:flutter/material.dart';

class CustomCounter extends StatelessWidget {
  const CustomCounter({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
          bottom: screenHeight * 0.02),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 36,
            color: Colors.black,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
