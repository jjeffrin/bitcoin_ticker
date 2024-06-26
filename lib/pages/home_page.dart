import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> cryptoCoins = ['BTC', 'ETH', 'LTC'];
  final List<String> currencies = ['USD', 'INR', 'EUR'];
  String selectedCurrency = 'USD';

  List<Widget> getCryptoCoinContainers(String currency) {
    List<Container> containersToReturn = [];

    for (String coin in cryptoCoins) {
      containersToReturn.add(Container(
        margin: const EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.amber[100]),
        height: 50.0,
        width: double.infinity,
        child: Center(
            child: Text(
          '1 $coin = 1000 $currency',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
      ));
    }

    return containersToReturn;
  }

  List<Widget> getCurrencyChips() {
    List<ChoiceChip> chipsToReturn = [];
    for (String currency in currencies) {
      chipsToReturn.add(ChoiceChip(
        elevation: 16.0,
        backgroundColor: Colors.amber, 
        side: const BorderSide(color: Colors.amber),
        label: Text(currency),
        selected: currency == selectedCurrency,
        onSelected: (bool value) {
          setState(() {
            selectedCurrency = currency;
          });
        },
      ));
    }
    return chipsToReturn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '🤑 Coin Ticker',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.amber[50],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: getCryptoCoinContainers('USD'),
            ),
          ),
          Container(
              width: double.infinity,
              height: 200.0,
              color: Colors.amberAccent,
              child: Center(
                child: Wrap(
                  spacing: 10.0,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: getCurrencyChips(),
                ),
              )),
        ],
      ),
    );
  }
}
