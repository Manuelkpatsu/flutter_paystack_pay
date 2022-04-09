import 'package:flutter/material.dart';

class SelectablePaymentScreen extends StatefulWidget {
  const SelectablePaymentScreen({Key? key}) : super(key: key);

  @override
  State<SelectablePaymentScreen> createState() =>
      _SelectablePaymentScreenState();
}

class _SelectablePaymentScreenState extends State<SelectablePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selectable Payment'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Center(
        child: Text('Selectable Payment Screen'),
      ),
    );
  }
}
