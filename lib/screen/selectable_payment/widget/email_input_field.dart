import 'package:flutter/material.dart';
import 'package:paystack_payment/util/validator.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const EmailInputField({
    Key? key,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: Validator.email,
    );
  }
}
