import 'package:freezed_annotation/freezed_annotation.dart';

part 'bitcoin_exchange_rate.freezed.dart';
part 'bitcoin_exchange_rate.g.dart';

@freezed
class BitcoinExchangeRate with _$BitcoinExchangeRate {
  const factory BitcoinExchangeRate({
    required String currencyCode,
    required String currencyName,
    required double rate,
  }) = _BitcoinExchangeRate;
}

@freezed
class BitcoinExchangeRatesResponse with _$BitcoinExchangeRatesResponse {
  const factory BitcoinExchangeRatesResponse({
    required String date,
    required Map<String, double> btc,
  }) = _BitcoinExchangeRatesResponse;

  factory BitcoinExchangeRatesResponse.fromJson(Map<String, Object?> json) => _$BitcoinExchangeRatesResponseFromJson(json);
}

@freezed
class BitcoinExchangeRatesData  with _$BitcoinExchangeRatesData {
  const factory BitcoinExchangeRatesData({
    required String date,
    required List<BitcoinExchangeRate> items,
  }) = _BitcoinExchangeRatesData;
}