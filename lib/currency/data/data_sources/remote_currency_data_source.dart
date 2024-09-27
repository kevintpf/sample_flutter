
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sample_flutter/currency/data/models/bitcoin_exchange_rate.dart';

part 'remote_currency_data_source.g.dart';

@RestApi(baseUrl: 'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/')
abstract class RemoteCurrencyDataSource {
  factory RemoteCurrencyDataSource(Dio dio, {String? baseUrl}) = _RemoteCurrencyDataSource;

  @GET('/currencies/btc.min.json')
  Future<BitcoinExchangeRatesResponse> getBTCCurrencyRate();

  @GET('/currencies.json')
  Future<Map<String,String>> getCurrencyList();
}