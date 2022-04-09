import 'package:flutter/material.dart';
import 'package:paystack_payment/locator.dart';

import 'screen/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
