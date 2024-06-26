import 'package:bitcoin_ticker/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BitcoinTickerApp());
}

class BitcoinTickerApp extends StatelessWidget {
  const BitcoinTickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}
