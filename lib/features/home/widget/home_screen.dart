import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/constant/constants.dart';
import 'package:hr_app_flutter/core/widget/components/custom_curved_nav_bar/custom_curved_nav_bar.dart';
import 'package:hr_app_flutter/core/widget/components/shimmer/shimmer.dart';
import 'package:hr_app_flutter/features/home/widget/company_screen.dart';
import 'package:hr_app_flutter/features/home/widget/education_screen.dart';
import 'package:hr_app_flutter/features/home/widget/grass_coin_screen.dart';
import 'package:hr_app_flutter/features/home/widget/home_scope.dart';
import 'package:hr_app_flutter/features/home/widget/services_screen.dart';
import 'package:hr_app_flutter/features/home/widget/user_main_screen.dart';

/// {@template home_screen}
/// HomeScreen widget.
/// {@endtemplate}
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HomeScope(
      child: Scaffold(
        body: BodyHomeWidget(),
        bottomNavigationBar: BottomBarHomeWidget(),
      ),
    );
  }
}

class BottomBarHomeWidget extends StatelessWidget {
  const BottomBarHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      index: HomeScope.of(
        context,
      ).state.tab.index,
      onTap: HomeScope.of(context, listen: false).state.onItemTapped,
      items: const [
        CustomNavBarElementWidget(
          icon: HRAppCustomIcon.iconExclamationMark,
          text: 'Компания',
        ),
        CustomNavBarElementWidget(
          icon: HRAppCustomIcon.iconCoin,
          text: 'Коины',
        ),
        CustomNavBarElementWidget(
          icon: HRAppCustomIcon.iconHome,
          text: 'Главная',
        ),
        CustomNavBarElementWidget(
          icon: HRAppCustomIcon.iconEducation,
          text: 'Обучение',
        ),
        CustomNavBarElementWidget(
          icon: HRAppCustomIcon.iconService,
          text: 'Сервисы',
        ),
      ],
    );
  }
}

class BodyHomeWidget extends StatelessWidget {
  const BodyHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: IndexedStack(
        index: HomeScope.of(context).state.tab.index,
        children: const <Widget>[
          CompanyScreen(),
          GrassCoinScreen(),
          UserMainBucket(),
          EducationScreen(),
          ServicesScreen(),
        ],
      ),
    );
  }
}

class CustomNavBarElementWidget extends StatelessWidget {
  const CustomNavBarElementWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 25,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        const SizedBox(height: 7),
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
