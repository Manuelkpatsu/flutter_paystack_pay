import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:paystack_payment/repository/payment_repository.dart';

import 'screen/card_payment/card_payment_notifier.dart';
import 'screen/home/home_notifier.dart';
import 'screen/navigation_controller.dart';

final GetIt get = GetIt.instance;

void setUpLocator() {
  get.registerFactory(() => PaymentRepository());

  get.registerFactoryParam<NavigationController, BuildContext, void>(
    (context, _) => NavigationController(context),
  );

  get.registerFactoryParam<CardPaymentNotifier, BuildContext, void>(
    (context, _) => CardPaymentNotifier(get<PaymentRepository>(), context),
  );

  get.registerFactoryParam<HomeNotifier, BuildContext, void>(
    (context, _) => HomeNotifier(
      get<NavigationController>(param1: context),
    ),
  );
}
