import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PayButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Pay'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        elevation: 0,
      ),
    );
  }
}
