import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/wallet/bloc/wallet_bloc/wallet_bloc.dart';
import 'package:hr_app_flutter/features/wallet/widget/exchange_coin_for_pass/exchange_coin_for_pass_scope.dart';

class ExchangeCoinForPass extends StatelessWidget {
  const ExchangeCoinForPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'Обмен на пропуск',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
        ),
      ),
      body: ExchangeCoinForPassScope(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Количество твоих коинов',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    const BalanceInfoWidget(),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Image.asset(
                      'assets/images/bracer_grass.png',
                    ),
                    const SizedBox(
                      height: 13.0,
                    ),
                    const Text(
                      'Сколько меняем?',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const CounterWidget(),
                  ],
                ),
              ),
            ),
            const SendCoinToBracerButtonWidget(),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}

class SendCoinToBracerButtonWidget extends StatelessWidget {
  const SendCoinToBracerButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 57)),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => Theme.of(context).colorScheme.primary),
        ),
        child: const Text(
          'Перевести',
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
    );
  }
}

class BalanceInfoWidget extends StatelessWidget {
  const BalanceInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF00C8E0), Color(0xFF00D000)],
        ),
        borderRadius: BorderRadius.circular(63),
      ),
      child: BlocBuilder<WalletBLoC, WalletState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(
                top: 4.0, left: 22.0, right: 22.0, bottom: 4.0),
            child: Text(
              '${state.data == null ? '0' : state.data!.balance} coin',
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double radius = 18.0;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  final state =
                      ExchangeCoinForPassScope.of(context, listen: false).state;
                  state.decrementCounter();
                },
                tooltip: 'Decrement',
                icon: const Icon(
                  Icons.remove,
                  size: 47,
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: IntrinsicWidth(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 6,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: TextField(
                      // cursorHeight: 38,
                      controller:
                          ExchangeCoinForPassScope.of(context).state.controller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(radius))),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 6.0,
                        ),
                      ),
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  final state =
                      ExchangeCoinForPassScope.of(context, listen: false).state;
                  state.incrementCounter();
                },
                tooltip: 'Increment',
                icon: const Icon(
                  Icons.add,
                  size: 47,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 7.0,
          ),
          Text(
            '${ExchangeCoinForPassScope.of(context).state.amountRub} рублей',
            style: const TextStyle(fontSize: 19),
          ),
        ],
      ),
    );
  }
}
