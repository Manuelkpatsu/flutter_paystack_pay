import 'package:flutter/material.dart';

class CardPaymentButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CardPaymentButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Card Payment'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        elevation: 0,
      ),
    );
  }
}
