import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_expample_app/StreamProvider/providers.dart';

class BitCoinPriceView extends ConsumerWidget {
  const BitCoinPriceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bitCOinPrice = ref.watch(bitcoinPriceProvider('bitcoin'));

    return bitCOinPrice.when(data: (data) {
      final currency = data.keys.first;
      final price = data[currency];
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(currency.toString()),
              Text(price.toString()),
            ],
          ),
        ),
      );
    }, error: (err, stk) {
      return Text(err.toString());
    }, loading: () {
      return const CircularProgressIndicator();
    });
  }
}
