import 'package:flutter/material.dart';

class Helper {
  /// Shows a snackbar
  static void showSnackbar(BuildContext context, String text) {
    final snackbar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
