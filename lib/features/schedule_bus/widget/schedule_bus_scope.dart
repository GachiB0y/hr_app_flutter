import 'package:flutter/widgets.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/schedule_bus/bloc/schedule_bus_bloc.dart';

/// {@template exchange_coin_for_pass_scope_controller}
/// A controller that holds and operates the ExchangeCoinForPassScope.
/// {@endtemplate}
abstract interface class ScheduleBusController {
  /// Get Cities.
  void getCities();

  /// Get Destinations.
  void getDestinations(
      {required int cityId,
      required String timeOfDay,
      required String routeForJob});

  /// Increment index.
  void incrementIndex(int? index);

  /// Decrement index.
  void decrementIndex(int? index);

  // /// Set time of day.
  // void setTimeOfDay(String timesOfDay);

  // /// Set route for job.
  // void setRouteForJob(String routeForJob);
}

/// {@template schedule_bus_scope}
/// ScheduleBusScope widget.
/// {@endtemplate}
class ScheduleBusScope extends StatefulWidget {
  /// {@macro schedule_bus_scope}
  const ScheduleBusScope({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  static _InheritedScheduleBusScope of(BuildContext context,
          {bool listen = true}) =>
      _InheritedScheduleBusScope.of(context, listen: listen);

  @override
  State<ScheduleBusScope> createState() => _ScheduleBusScopeState();
}

/// State for widget ScheduleBusScope.
class _ScheduleBusScopeState extends State<ScheduleBusScope>
    implements ScheduleBusController {
  int _cityId = 0;
  int _index = 0;
  String _timesOfDay = '';
  String _routeForJob = '';
  late final ScheduleBusBLoC scheduleBusBloc;
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    scheduleBusBloc = ScheduleBusBLoC(
      repository: DependenciesScope.of(context).scheduleBusRepository,
    )..add(const ScheduleBusEvent.fetchCitites());
  }

  @override
  void didUpdateWidget(ScheduleBusScope oldWidget) {
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
    super.dispose();
  }

  /* #endregion */

  @override
  Widget build(BuildContext context) => _InheritedScheduleBusScope(
        state: this,
        child: widget.child,
      );

  @override
  void getCities() {
    scheduleBusBloc.add(const ScheduleBusEvent.fetchCitites());
  }

  @override
  void getDestinations(
      {required int cityId,
      required String timeOfDay,
      required String routeForJob}) {
    scheduleBusBloc.add(ScheduleBusEvent.fetchDestinations(
        cityId: cityId, timeOfDay: timeOfDay, routeForJob: routeForJob));
  }

  int get index {
    return _index;
  }

  set setCityId(int cityId) {
    setState(() {
      _cityId = cityId;
    });
  }

  int get cityId {
    return _cityId;
  }

  set setRouteForJob(String routeForJob) {
    setState(() {
      _routeForJob = routeForJob;
    });
  }

  String get routeForJob {
    return _routeForJob;
  }

  set setTimeOfDay(String timesOfDay) {
    setState(() {
      _timesOfDay = timesOfDay;
    });
  }

  String get timesOfDay {
    return _timesOfDay;
  }

  @override
  void decrementIndex(int? index) {
    setState(() {
      if (_index == 0) {
        return;
      }
      if (index != null) {
        _index = index;
      } else {
        _index -= 1;
      }
    });
  }

  @override
  void incrementIndex(int? index) {
    setState(() {
      if (_index == 5) {
        return;
      }
      if (index != null) {
        _index = index;
      } else {
        _index += 1;
      }
    });
  }
}

/// Inherited widget for quick access in the element tree.
class _InheritedScheduleBusScope extends InheritedWidget {
  const _InheritedScheduleBusScope({
    required this.state,
    required super.child,
  });

  final _ScheduleBusScopeState state;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// For example: `ScheduleBusScope.maybeOf(context)`.
  static _InheritedScheduleBusScope? maybeOf(BuildContext context,
          {bool listen = true}) =>
      listen
          ? context
              .dependOnInheritedWidgetOfExactType<_InheritedScheduleBusScope>()
          : context
              .getElementForInheritedWidgetOfExactType<
                  _InheritedScheduleBusScope>()
              ?.widget as _InheritedScheduleBusScope?;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedScheduleBusScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// For example: `ScheduleBusScope.of(context)`.
  static _InheritedScheduleBusScope of(BuildContext context,
          {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant _InheritedScheduleBusScope oldWidget) =>
      !identical(state, oldWidget) || state != oldWidget.state;
}
