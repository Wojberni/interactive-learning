import 'package:flutter/material.dart';

enum SnackBarType { info, error }

const errorBackgroundColor = Colors.red;
var infoBackgroundColor = const SnackBarThemeData().backgroundColor;

void showSnackBar(BuildContext context, String message, SnackBarType type,
    {bool unfocus = true}) {
  if (unfocus) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: type == SnackBarType.error
          ? errorBackgroundColor
          : infoBackgroundColor,
      content: Text(
        message,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
