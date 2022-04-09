import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:paystack_payment/util/helper.dart';

class PaymentRepository {
  /// Your paystack public key.
  static const String publicKey =
      'pk_test_d5983ffd11079b19141e3a478d3d53323c2126fa';
  final PaystackPlugin _plugin = PaystackPlugin();

  PaymentRepository();

  void initializePayment() {
    _plugin.initialize(publicKey: publicKey);
  }

  Future<CheckoutResponse> makePayment({
    required String email,
    required double amount,
    required BuildContext context,
  }) async {
    Charge charge = Charge()
      ..amount = (amount * 100).toInt()
      ..reference = Helper().generateUniqueId()
      ..email = email
      ..currency = 'GHS';

    return await _plugin.checkout(
      context,
      charge: charge,
      method: CheckoutMethod.card,
    );
  }
}
