import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sample_flutter/currency/currency.dart';

final getIt = GetIt.instance;

class ProductionServiceLocator {
  @mustCallSuper
  Future<void> setup() async {
    final dio = createDio();
    getIt
      ..registerSingleton(dio)
      ..registerSingleton(RemoteCurrencyDataSource(getIt()))
      ..registerSingleton(CurrencyRepository(getIt()))
      ..registerFactory(() => GetBitcoinExchangeRatesState(getIt()))
      ..registerFactory(() => BitcoinExchangeRatesCubit(getIt()));
  }

  Dio createDio() {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
    ));
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          compact: true,
          maxWidth: 1000,
          enabled: kDebugMode,
        ),
      );
    }

    return dio;
  }
}

class StagingServiceLocator extends ProductionServiceLocator {}

class DevelopmentServiceLocator extends ProductionServiceLocator {}
