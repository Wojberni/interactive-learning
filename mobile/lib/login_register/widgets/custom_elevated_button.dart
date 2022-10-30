import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {

  const CustomElevatedButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final _buttonColor = const Color(0xFFD0CECE);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 50, vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: _buttonColor,
          minimumSize: const Size(
            double.infinity,
            70,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 34,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}