import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/wallet/bloc/coins_reward_bloc/coins_reward_bloc.dart';
import 'package:hr_app_flutter/features/wallet/model/coins_screen/coins_reward/coins_reward.dart';

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
            padding: EdgeInsets.only(
              left: 25.0,
              right: 25.0,
            ),
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
    coinsRewardBloc = CoinsRewardBLoC(walletRepository: DependenciesScope.of(context).walletRepository);
    coinsRewardBloc.add(const CoinsRewardEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(padding: EdgeInsets.only(top: 35.0)),
        BlocBuilder<CoinsRewardBLoC, CoinsRewardState>(
            bloc: coinsRewardBloc,
            builder: (context, state) {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 155.0,
                  mainAxisSpacing: 24.0,
                  crossAxisSpacing: 30.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return state.map(
                      idle: (state) => _ElementGrid(
                        item: state.data![index],
                      ),
                      processing: (_) => ShimmerLoading(
                        isLoading: true,
                        child: Container(
                          alignment: Alignment.center,
                        ),
                      ),
                      successful: (state) => _ElementGrid(
                        item: state.data![index],
                      ),
                      error: (state) => Center(
                        child: Text(state.message),
                      ),
                    );
                  },
                  childCount: state.data!.length,
                ),
              );
            })
      ],
    );
  }
}

class _ElementGrid extends StatelessWidget {
  const _ElementGrid({
    super.key,
    required this.item,
  });

  final CoinsReward item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            item.image == null
                ? Image.asset(
                    'assets/images/party-popper_big.webp',
                    width: 56,
                    height: 56,
                  )
                : Image.network(
                    item.image!,
                    width: 56,
                    height: 56,
                  ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 56,
              height: 56,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.price.toString(),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'coin',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
        Text(
          item.title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          item.description ?? '',
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
