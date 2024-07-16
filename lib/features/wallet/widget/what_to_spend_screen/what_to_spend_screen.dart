import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/wallet/widget/components/grid_info_widget.dart';
import 'package:hr_app_flutter/ui/commons/widget/components/shimmer/shimmer.dart';

class WhatToSpendScreen extends StatelessWidget {
  const WhatToSpendScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
              child: GridInfoCoins(
                route: Routes.whatToSpendScreen,
              ),
            ),
          ),
        ),
      );
}
