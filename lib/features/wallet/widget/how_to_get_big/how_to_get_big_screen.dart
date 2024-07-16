import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/wallet/widget/components/grid_info_widget.dart';
import 'package:hr_app_flutter/ui/commons/widget/components/shimmer/shimmer.dart';

/// Screen for how to get big coins
class HowToGetBigScreen extends StatelessWidget {
  const HowToGetBigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'Как получить?',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Shimmer(
          child: Padding(
            padding: EdgeInsets.only(
              left: 25.0,
              right: 25.0,
            ),
            child: GridInfoCoins(
              route: Routes.howToGetBigScreen,
            ),
          ),
        ),
      ),
    );
  }
}
