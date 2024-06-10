import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/widget/components/shimmer/shimmer.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/wallet/bloc/coins_reward_bloc/coins_reward_bloc.dart';

class WhatToSpendScreen extends StatelessWidget {
  const WhatToSpendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'На что потратить?',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
        ),
      ),
      body: const SafeArea(
        child: Shimmer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: CustomGridWhatToSpend(),
          ),
        ),
      ),
    );
  }
}

class CustomGridWhatToSpend extends StatefulWidget {
  const CustomGridWhatToSpend({
    super.key,
  });

  @override
  State<CustomGridWhatToSpend> createState() => _CustomGridWhatToSpendState();
}

class _CustomGridWhatToSpendState extends State<CustomGridWhatToSpend> {
  late final CoinsRewardBLoC coinsRewardBloc;
  @override
  void initState() {
    coinsRewardBloc = CoinsRewardBLoC(
        walletRepository: DependenciesScope.of(context).walletRepository);
    coinsRewardBloc.add(const CoinsRewardEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BlocBuilder<CoinsRewardBLoC, CoinsRewardState>(
            bloc: coinsRewardBloc,
            builder: (context, state) {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 36.0,
                  crossAxisSpacing: 30.0,
                  childAspectRatio: 0.95,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (state is CoinsRewardState$Processing) {
                      return ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          alignment: Alignment.center,
                        ),
                      );
                    } else if (state is CoinsRewardState$Error) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return _ElementGrid(
                        title: state.data![index].title,
                        price: state.data![index].price.toString(),
                        description: state.data![index].title,
                      );
                    }
                  },
                  childCount: state.data!.length,
                ),
              );
            })
      ],
    );
  }
}

// ignore: unused_element
class _ElementGrid extends StatelessWidget {
  const _ElementGrid(
      {super.key,
      required this.title,
      required this.price,
      required this.description});
  final String title;
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/party-popper_big.png',
              scale: 0.7,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    'coin',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          description,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
