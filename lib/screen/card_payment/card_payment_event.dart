import 'package:flutter/material.dart';

abstract class CardPaymentEvent {}

@immutable
class MakePaymentEvent extends CardPaymentEvent {
  final String email;
  final double amount;
  final BuildContext context;

  MakePaymentEvent(this.email, this.amount, this.context);
}
