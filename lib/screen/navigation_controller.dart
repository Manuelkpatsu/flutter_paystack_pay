import 'package:flutter/material.dart';

import 'card_payment/card_payment_screen.dart';
import 'selectable_payment/selectable_payment_screen.dart';

class NavigationController {
  final BuildContext _context;

  NavigationController(this._context);

  // Navigates to [CardPaymentScreen]
  void goToCardPaymentScreen() {
    Navigator.push(
      _context,
      MaterialPageRoute(builder: (context) => const CardPaymentScreen()),
    );
  }

  // Navigates to [SelectablePaymentScreen]
  void goToSelectablePaymentScreen() {
    Navigator.push(
      _context,
      MaterialPageRoute(builder: (context) => const SelectablePaymentScreen()),
    );
  }
}
