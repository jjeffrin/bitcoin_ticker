import 'package:bitcoin_ticker/models/currency_model.dart';
import 'package:bitcoin_ticker/services/network.dart';

import '../secrets.dart';

class Currency {
  final List<String> cryptoCoins = ['BTC', 'ETH', 'LTC'];
  final String _authority = 'rest.coinapi.io';
  final String _unencodedPath = '/v1/exchangerate/';
  final Network _networkHelper = Network();

  Future<List<CurrencyModel>> getCurrencyData(String currency) async {
    List<CurrencyModel> dataToReturn = [];
    try {
      Map<String, dynamic> data = await _networkHelper.getData(_authority,
          _unencodedPath + currency, {'apiKey': apiKey, 'invert': 'true'});
      for (int index = 0; index < data['rates'].length; index++) {
        var coinName = data['rates'][index]['asset_id_quote'];
        var rate = data['rates'][index]['rate'];
        if (coinName == 'BTC' || coinName == 'ETH' || coinName == 'LTC') {
          dataToReturn.add(CurrencyModel(cryptoCoinName: coinName, rate: rate));
        }
      }
      return Future.value(dataToReturn);
    } catch (err) {
      return Future.error(err);
    }
  }
}
