import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:paystack_payment/repository/payment_repository.dart';
import 'package:paystack_payment/util/helper.dart';
import 'package:rxdart/rxdart.dart';

import 'card_payment_event.dart';

class CardPaymentNotifier extends ValueNotifier<dynamic> {
  final _logger = Logger();
  final PaymentRepository _paymentRepository;
  final BuildContext _context;
  late final PublishSubject<CardPaymentEvent> _eventSubject;

  CardPaymentNotifier(this._paymentRepository, this._context) : super(dynamic);

  void init(PublishSubject<CardPaymentEvent> eventSubject) {
    _eventSubject = eventSubject;

    _paymentRepository.initializePayment();

    _eventSubject.stream
        .listen((event) => _handleEvent(event))
        .onError((error, stackTrace) {
      _logger.e("Error handling card payment event", error, stackTrace);
    });
  }

  /// Handles [CardPaymentEvent]s
  _handleEvent(CardPaymentEvent event) {
    if (event is MakePaymentEvent) {
      _makePayment(email: event.email, amount: event.amount);
    } else {
      _logger.w('Unhandled card payment event type: ${event.runtimeType}');
    }
  }

  void _makePayment({required String email, required double amount}) {
    _paymentRepository
        .makePayment(email: email, amount: amount, context: _context)
        .then((response) {
      Helper.showSnackbar(_context, response.message);
    }).catchError((error, stackTrace) {
      _logger.e('Error making payment', error, stackTrace);
      Helper.showSnackbar(_context, error.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
