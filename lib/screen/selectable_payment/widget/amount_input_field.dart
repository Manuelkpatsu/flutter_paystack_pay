import 'package:flutter/material.dart';
import 'package:paystack_payment/util/validator.dart';

class AmountInputField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const AmountInputField({
    Key? key,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Amount (GHS)'),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      validator: Validator.amount,
    );
  }
}
