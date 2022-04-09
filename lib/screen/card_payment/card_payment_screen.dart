import 'package:flutter/material.dart';
import 'package:paystack_payment/locator.dart';
import 'package:rxdart/rxdart.dart';

import 'card_payment_event.dart';
import 'card_payment_notifier.dart';
import 'widget/amount_text_field.dart';
import 'widget/email_text_field.dart';
import 'widget/pay_button.dart';

class CardPaymentScreen extends StatefulWidget {
  const CardPaymentScreen({Key? key}) : super(key: key);

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final CardPaymentNotifier _notifier;
  final _eventSubject = PublishSubject<CardPaymentEvent>();

  @override
  void initState() {
    super.initState();
    _notifier = get<CardPaymentNotifier>(param1: context);
    _notifier.init(_eventSubject);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _amountController.dispose();
    _notifier.dispose();
    _eventSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Payment'),
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
                EmailTextField(controller: _emailController),
                const SizedBox(height: 10),
                AmountTextField(controller: _amountController),
                const SizedBox(height: 20),
                PayButton(onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _eventSubject.add(MakePaymentEvent(
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
