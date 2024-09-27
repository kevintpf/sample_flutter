import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:sample_flutter/currency/currency.dart';

part 'bitcoin_exchange_rates_cubit.freezed.dart';

@freezed
sealed class BitcoinExchangeRatesState with _$BitcoinExchangeRatesState {
  factory BitcoinExchangeRatesState.loading() = BitcoinExchangeRatesStateLoading;

  factory BitcoinExchangeRatesState.error(String errorMessage) = BitcoinExchangeRatesStateError;

  factory BitcoinExchangeRatesState.success(BitcoinExchangeRatesData data) = BitcoinExchangeRatesStateSuccess;
}

class BitcoinExchangeRatesCubit extends Cubit<BitcoinExchangeRatesState> {
  BitcoinExchangeRatesCubit(this.getBTCCurrencyRateUseCase) : super(BitcoinExchangeRatesState.loading());

  @visibleForTesting
  GetBitcoinExchangeRatesState getBTCCurrencyRateUseCase;

  final _logger = Logger('BTCCurrenciesRateCubit');

  Future<void> load() async {
    try {
      emit(BitcoinExchangeRatesState.loading());
      final data = await getBTCCurrencyRateUseCase.call();
      emit(BitcoinExchangeRatesState.success(data));
    } catch (e, stacktrace) {
      _logger.info('Cannot load btn currencies rate', e, stacktrace);
      emit(BitcoinExchangeRatesState.error('Cannot load btc exchange rates'));
    }
  }
}
