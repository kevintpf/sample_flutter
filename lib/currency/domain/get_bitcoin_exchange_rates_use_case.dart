import 'package:meta/meta.dart';
import 'package:sample_flutter/currency/data/models/bitcoin_exchange_rate.dart';
import 'package:sample_flutter/currency/data/repositories/currency_repository.dart';

class GetBitcoinExchangeRatesState {
  GetBitcoinExchangeRatesState(this.currencyRepository);

  @visibleForTesting
  final CurrencyRepository currencyRepository;

  Future<BitcoinExchangeRatesData> call() async {
    final currencies = await currencyRepository.getCurrencyList();
    final btcCurrenciesRate = await currencyRepository.getBitcoinExchangeRates();

    final filteredItems = btcCurrenciesRate.btc.keys
        .where((e) => e != 'btc')
        .map(
          (e) => BitcoinExchangeRate(currencyCode: e, currencyName: currencies[e] ?? '', rate: btcCurrenciesRate.btc[e] ?? 0),
        )
        .toList();

    return BitcoinExchangeRatesData(date: btcCurrenciesRate.date, items: filteredItems);
  }
}
