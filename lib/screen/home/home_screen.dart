import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../locator.dart';
import 'home_event.dart';
import 'home_notifier.dart';
import 'widget/card_payment_button.dart';
import 'widget/selectable_payment_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeNotifier _notifier;
  final _eventSubject = PublishSubject<HomeEvent>();

  @override
  void initState() {
    super.initState();
    _notifier = get<HomeNotifier>(param1: context);
    _notifier.init(_eventSubject);
  }

  @override
  void dispose() {
    _notifier.dispose();
    _eventSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paystack Payments'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardPaymentButton(
                onPressed: () => _eventSubject.add(
                  GoToCardPaymentScreenEvent(),
                ),
              ),
              const SizedBox(height: 20),
              SelectablePaymentButton(
                onPressed: () => _eventSubject.add(
                  GoToSelectablePaymentScreenEvent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
