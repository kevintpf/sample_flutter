
import 'package:meta/meta.dart';
import 'package:sample_flutter/currency/data/data_sources/remote_currency_data_source.dart';
import 'package:sample_flutter/currency/data/models/bitcoin_exchange_rate.dart';

class CurrencyRepository {
  CurrencyRepository(this.remoteCurrencyDataSource);

  @visibleForTesting
  final RemoteCurrencyDataSource remoteCurrencyDataSource;

  Future<BitcoinExchangeRatesResponse> getBitcoinExchangeRates() => remoteCurrencyDataSource.getBTCCurrencyRate();

  Future<Map<String,String>> getCurrencyList() => remoteCurrencyDataSource.getCurrencyList();
}
