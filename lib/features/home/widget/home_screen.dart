import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/constant/constants.dart';
import 'package:hr_app_flutter/core/widget/components/custom_curved_nav_bar/custom_curved_nav_bar.dart';
import 'package:hr_app_flutter/core/widget/components/shimmer/shimmer.dart';
import 'package:hr_app_flutter/features/home/bloc/main_app_screen_view_cubit/main_app_screen_view_cubit.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/home/widget/company_screen.dart';
import 'package:hr_app_flutter/features/home/widget/education_screen.dart';
import 'package:hr_app_flutter/features/home/widget/grass_coin_screen.dart';
import 'package:hr_app_flutter/features/home/widget/services_screen.dart';
import 'package:hr_app_flutter/features/home/widget/user_main_screen.dart';
import 'package:octopus/octopus.dart';

/// {@template shop_tabs_enum}
/// HomeTabsEnum enumeration
/// {@endtemplate}
enum HomeTabsEnum implements Comparable<HomeTabsEnum> {
  /// Company
  company('company'),

  /// Coins
  coin('coin'),

  /// UserMain
  userMain('user_main'),

  /// Education
  education('education'),

  /// Services
  services('services');

  /// {@macro shop_tabs_enum}
  const HomeTabsEnum(this.name);

  /// Creates a new instance of [HomeTabsEnum] from a given string.
  static HomeTabsEnum fromValue(String? value, {HomeTabsEnum? fallback}) =>
      switch (value?.trim().toLowerCase()) {
        'usermain' => userMain,
        'coin' => coin,
        'company' => company,
        'education' => education,
        'services' => services,
        _ => fallback ?? (throw ArgumentError.value(value)),
      };

  /// Value of the enum
  final String name;

  /// Pattern matching
  T map<T>({
    required T Function() userMain,
    required T Function() coin,
    required T Function() company,
    required T Function() education,
    required T Function() services,
  }) =>
      switch (this) {
        HomeTabsEnum.userMain => userMain(),
        HomeTabsEnum.coin => coin(),
        HomeTabsEnum.company => company(),
        HomeTabsEnum.education => education(),
        HomeTabsEnum.services => services(),
      };

  /// Pattern matching
  T maybeMap<T>({
    required T Function() orElse,
    T Function()? userMain,
    T Function()? coin,
    T Function()? company,
    T Function()? education,
    T Function()? services,
  }) =>
      map<T>(
        userMain: userMain ?? orElse,
        coin: coin ?? orElse,
        company: company ?? orElse,
        education: education ?? orElse,
        services: services ?? orElse,
      );

  /// Pattern matching
  T? maybeMapOrNull<T>({
    T Function()? userMain,
    T Function()? coin,
    T Function()? company,
    T Function()? education,
    T Function()? services,
  }) =>
      maybeMap<T?>(
        orElse: () => null,
        userMain: userMain,
        coin: coin,
        company: company,
        education: education,
        services: services,
      );

  @override
  int compareTo(HomeTabsEnum other) => index.compareTo(other.index);

  @override
  String toString() => name;
}

/// {@template home_screen}
/// HomeScreen widget.
/// {@endtemplate}
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Octopus state observer
  late final OctopusStateObserver _octopusStateObserver;

  // Current tab
  HomeTabsEnum _tab = HomeTabsEnum.userMain;

  @override
  void initState() {
    super.initState();
    _octopusStateObserver = context.octopus.observer;

    // Restore tab from router arguments
    _tab = HomeTabsEnum.fromValue(
      _octopusStateObserver.value.arguments['home'],
      fallback: HomeTabsEnum.userMain,
    );
    _octopusStateObserver.addListener(_onOctopusStateChanged);
  }

  @override
  void dispose() {
    _octopusStateObserver.removeListener(_onOctopusStateChanged);
    super.dispose();
  }

  // Change tab
  void _switchTab(HomeTabsEnum tab) {
    if (!mounted) return;
    if (_tab == tab) return;
    context.octopus.setArguments((args) => args['home'] = tab.name);
    setState(() => _tab = tab);
  }

  // Bottom navigation bar item tapped
  void _onItemTapped(int index) {
    final newTab = HomeTabsEnum.values[index];
    if (_tab == newTab) {
      // The same tab tapped twice
      if (newTab == HomeTabsEnum.userMain) debugPrint('DoubleClick User Main');
    } else {
      // Switch tab to new one
      _switchTab(newTab);
    }
  }

  // Router state changed
  void _onOctopusStateChanged() {
    final newTab = HomeTabsEnum.fromValue(
      _octopusStateObserver.value.arguments['home'],
      fallback: HomeTabsEnum.userMain,
    );
    _switchTab(newTab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer(
        child: IndexedStack(
          index: _tab.index,
          children: const <Widget>[
            CompanyScreen(),
            GrassCoinScreen(),
            UserMainScreen(),
            EducationScreen(),
            ServicesScreen(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        index: _tab.index,
        onTap: _onItemTapped,
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
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ],
    );
  }
}
