import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:paystack_payment/screen/navigation_controller.dart';
import 'package:rxdart/rxdart.dart';

import 'home_event.dart';

class HomeNotifier extends ValueNotifier<dynamic> {
  final _logger = Logger();
  final NavigationController _navigationController;
  late final PublishSubject<HomeEvent> _eventSubject;

  HomeNotifier(this._navigationController) : super(dynamic);

  void init(PublishSubject<HomeEvent> eventSubject) {
    _eventSubject = eventSubject;

    _eventSubject.stream
        .listen((event) => _handleEvent(event))
        .onError((error, stackTrace) {
      _logger.e("Error handling home event", error, stackTrace);
    });
  }

  /// Handles [HomeEvent]s
  _handleEvent(HomeEvent event) {
    if (event is GoToCardPaymentScreenEvent) {
      _navigationController.goToCardPaymentScreen();
    } else if (event is GoToSelectablePaymentScreenEvent) {
      _navigationController.goToSelectablePaymentScreen();
    } else {
      _logger.w('Unhandled home event type: ${event.runtimeType}');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
