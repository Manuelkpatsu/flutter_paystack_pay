import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../locator.dart';
import 'selectable_payment_event.dart';
import 'selectable_payment_notifier.dart';
import 'widget/amount_input_field.dart';
import 'widget/email_input_field.dart';
import 'widget/pay_here_button.dart';

class SelectablePaymentScreen extends StatefulWidget {
  const SelectablePaymentScreen({Key? key}) : super(key: key);

  @override
  State<SelectablePaymentScreen> createState() =>
      _SelectablePaymentScreenState();
}

class _SelectablePaymentScreenState extends State<SelectablePaymentScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final SelectablePaymentNotifier _notifier;
  final _eventSubject = PublishSubject<SelectablePaymentEvent>();

  @override
  void initState() {
    super.initState();
    _notifier = get<SelectablePaymentNotifier>(param1: context);
    _notifier.init(_eventSubject);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selectable Payment'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailInputField(controller: _emailController),
                const SizedBox(height: 10),
                AmountInputField(controller: _amountController),
                const SizedBox(height: 20),
                PayHereButton(onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _eventSubject.add(PaymentEvent(
                      _emailController.text,
                      double.parse(_amountController.text),
                      context,
                    ));
                    _formKey.currentState!.reset();
                  }
                }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
