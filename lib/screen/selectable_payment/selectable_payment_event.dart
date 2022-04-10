import 'package:flutter/material.dart';

abstract class SelectablePaymentEvent {}

@immutable
class PaymentEvent extends SelectablePaymentEvent {
  final String email;
  final double amount;
  final BuildContext context;

  PaymentEvent(this.email, this.amount, this.context);
}
