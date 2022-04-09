import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Helper {
  final Uuid _uuid = const Uuid();

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

  String generateUniqueId() {
    return _uuid.v4();
  }
}
