import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:paystack_payment/util/helper.dart';
import 'package:http/http.dart' as http;

class PaymentRepository {
  /// Your paystack public key.
  static const String publicKey =
      'pk_test_d5983ffd11079b19141e3a478d3d53323c2126fa';
  static const String backendUrl =
      'https://paystack-test-backend.herokuapp.com';
  static const String appName = 'Paystack Example';
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

  Future<CheckoutResponse> selectablePayment({
    required String email,
    required double amount,
    required BuildContext context,
  }) async {
    var accessCode = await _fetchAccessCode();

    Charge charge = Charge()
      ..amount = (amount * 100).toInt()
      ..reference = Helper().generateUniqueId()
      ..email = email
      ..accessCode = accessCode
      ..currency = 'GHS';

    return await _plugin.checkout(
      context,
      charge: charge,
      method: CheckoutMethod.selectable,
    );
  }

  Future<String?> _fetchAccessCode() async {
    String url = '$backendUrl/new-access-code';
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode >= 200 && response.statusCode < 400) {
        return response.body;
      } else {
        throw response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> verifyReference(String reference) async {
    String url = '$backendUrl/verify/$reference';
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode >= 200 && response.statusCode < 400) {
        return response.body;
      } else {
        throw response.body;
      }
    } catch (e) {
      rethrow;
    }
  }
}
