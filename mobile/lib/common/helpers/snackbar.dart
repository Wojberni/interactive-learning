import 'package:flutter/material.dart';

enum SnackBarType { success, error, info }

const errorBackgroundColor = Colors.red;
var infoBackgroundColor = const SnackBarThemeData().backgroundColor;
const successBackgroundColor = Colors.green;

void showSnackBar(BuildContext context, String message, SnackBarType type,
    {bool unfocus = true}) {
  if (unfocus) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Color? snackBarColor;
  switch (type) {
    case SnackBarType.error:
      snackBarColor = errorBackgroundColor;
      break;
    case SnackBarType.info:
      snackBarColor = infoBackgroundColor;
      break;
    case SnackBarType.success:
      snackBarColor = successBackgroundColor;
      break;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: snackBarColor,
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
