import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/core/widget/components/shimmer/shimmer.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/wallet/bloc/coins_reward_bloc/coins_reward_bloc.dart';
import 'package:hr_app_flutter/features/wallet/widget/components/tile_coins_info.dart';

/// Grid for HowToGetBigScreen and  WhatToSpendScreen
class GridInfoCoins extends StatefulWidget {
  const GridInfoCoins({
    required this.route,
    super.key,
  });

  final Routes route;

  @override
  State<GridInfoCoins> createState() => _GridInfoCoinsState();
}

class _GridInfoCoinsState extends State<GridInfoCoins> {
  late final CoinsRewardBLoC coinsRewardBloc;
  @override
  void initState() {
    coinsRewardBloc = CoinsRewardBLoC(
      walletRepository: DependenciesScope.of(context).walletRepository,
    );

    if (widget.route == Routes.howToGetBigScreen) {
      coinsRewardBloc.add(const CoinsRewardEvent.getCoinsInfo());
    } else if (widget.route == Routes.whatToSpendScreen) {
      coinsRewardBloc.add(const CoinsRewardEvent.getCoinsReward());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          const SliverPadding(padding: EdgeInsets.only(top: 35.0)),
          BlocBuilder<CoinsRewardBLoC, CoinsRewardState>(
            bloc: coinsRewardBloc,
            builder: (context, state) => SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 155.0,
                mainAxisSpacing: 24.0,
                crossAxisSpacing: 30.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => state.map(
                  idle: (state) => TileCoinsInfo(
                    item: state.data![index],
                  ),
                  processing: (_) => ShimmerLoading(
                    isLoading: true,
                    child: Container(
                      alignment: Alignment.center,
                    ),
                  ),
                  successful: (state) => TileCoinsInfo(
                    item: state.data![index],
                  ),
                  error: (state) => Center(
                    child: Text(state.message),
                  ),
                ),
                childCount: state.data!.length,
              ),
            ),
          ),
        ],
      );
}
