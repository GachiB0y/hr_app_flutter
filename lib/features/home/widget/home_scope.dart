import 'package:flutter/widgets.dart';
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

abstract interface class HomeShellPageController {
  void onItemTapped(int index);
}

/// {@template home_scope}
/// HomeScope widget.
/// {@endtemplate}
class HomeScope extends StatefulWidget {
  /// {@macro home_scope}
  const HomeScope({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  static _InheritedHomeScope of(BuildContext context, {bool listen = true}) =>
      _InheritedHomeScope.of(context, listen: listen);

  @override
  State<HomeScope> createState() => _HomeScopeState();
}

/// State for widget HomeScope.
class _HomeScopeState extends State<HomeScope>
    implements HomeShellPageController {
  /* #region Lifecycle */

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
  void didUpdateWidget(HomeScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    _octopusStateObserver.removeListener(_onOctopusStateChanged);

    super.dispose();
  }

  // Change tab
  void _switchTab(HomeTabsEnum tab) {
    if (!mounted) return;
    if (_tab == tab) return;
    context.octopus.setArguments((args) => args['home'] = tab.name);
    setState(() => _tab = tab);
    debugPrint(_tab.toString());
  }

  // Bottom navigation bar item tapped
  @override
  void onItemTapped(int index) {
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
  /* #endregion */

  @override
  Widget build(BuildContext context) => _InheritedHomeScope(
        state: this,
        child: widget.child,
      );

  HomeTabsEnum get tab {
    return _tab;
  }
}

/// Inherited widget for quick access in the element tree.
class _InheritedHomeScope extends InheritedWidget {
  const _InheritedHomeScope({
    required this.state,
    required super.child,
  });

  final _HomeScopeState state;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// For example: `HomeScope.maybeOf(context)`.
  static _InheritedHomeScope? maybeOf(BuildContext context,
          {bool listen = true}) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<_InheritedHomeScope>()
          : context
              .getElementForInheritedWidgetOfExactType<_InheritedHomeScope>()
              ?.widget as _InheritedHomeScope?;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedHomeScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// For example: `HomeScope.of(context)`.
  static _InheritedHomeScope of(BuildContext context, {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant _InheritedHomeScope oldWidget) =>
      !identical(state, oldWidget) || state != oldWidget.state;
}
