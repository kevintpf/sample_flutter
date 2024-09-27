import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sample_flutter/app/app.dart';
import 'package:sample_flutter/app/di/dependencies.dart';
import 'package:sample_flutter/currency/data/models/bitcoin_exchange_rate.dart';
import 'package:sample_flutter/currency/ui/cubit/bitcoin_exchange_rates_cubit.dart';

class BitcoinExchangeRatesPage extends StatefulWidget {
  const BitcoinExchangeRatesPage({super.key});

  static const routeName = 'btc_exchange_rates';

  @override
  State<BitcoinExchangeRatesPage> createState() => _BitcoinExchangeRatesPageState();
}

class _BitcoinExchangeRatesPageState extends State<BitcoinExchangeRatesPage> {
  final _bloc = getIt<BitcoinExchangeRatesCubit>();

  @override
  void initState() {
    super.initState();
    _bloc.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BTC'),
        actions: [
          BlocBuilder<BitcoinExchangeRatesCubit, BitcoinExchangeRatesState>(
            bloc: _bloc,
            builder: (context, state) {
              final dateText = state is BitcoinExchangeRatesStateSuccess ? state.data.date : '';
              return Padding(
                padding: const EdgeInsets.only(right: Spacing.s_16),
                child: Text(dateText),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<BitcoinExchangeRatesCubit, BitcoinExchangeRatesState>(
        bloc: _bloc,
        builder: (context, state) {
          return switch (state) {
            BitcoinExchangeRatesStateLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            BitcoinExchangeRatesStateError() => Center(
                child: ExpText.bodyLarge(state.errorMessage),
              ),
            BitcoinExchangeRatesStateSuccess() => CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    sliver: SliverList.separated(
                      itemCount: state.data.items.length,
                      itemBuilder: (context, index) => _ExchangeRateListItem(state.data.items[index]),
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: Spacing.m_24),
                        child: Divider(),
                      ),
                    ),
                  )
                ],
              ),
          };
        },
      ),
    );
  }
}

class _ExchangeRateListItem extends StatelessWidget {
  const _ExchangeRateListItem(this.data);

  final BitcoinExchangeRate data;

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(name: '');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.m_24, vertical: Spacing.xs_8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              ExpText.titleMedium(
                data.currencyCode.toUpperCase(),
              ),
              if (data.currencyName.isNotEmpty)
                ExpText.titleSmall(
                  ' (${data.currencyName})',
                ),
            ],
          ),
          ExpText.bodyLarge(formatCurrency.format(data.rate)),
        ],
      ),
    );
  }
}