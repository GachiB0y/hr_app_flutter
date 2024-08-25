import 'package:flutter/material.dart';
import 'package:hr_app_flutter/features/wallet/model/coins_screen/coins_reward/coins_reward.dart';

/// Tile for GridInfoCoins
class TileCoinsInfo extends StatelessWidget {
  const TileCoinsInfo({
    required this.item,
    super.key,
  });

  final CoinsReward item;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                item.image!,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/images/pretzel.png',
                  width: 64,
                  height: 64,
                  cacheHeight: 64,
                  cacheWidth: 64,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.price.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'coin',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            item.title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Text(
            item.description ?? '',
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      );
}
