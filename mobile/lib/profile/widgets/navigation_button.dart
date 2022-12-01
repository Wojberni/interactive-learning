import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton(this.text, this.onPressed, {super.key});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[200]!),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 26,
          color: Colors.deepPurpleAccent,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
