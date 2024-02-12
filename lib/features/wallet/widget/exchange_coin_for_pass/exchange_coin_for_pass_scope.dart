import 'package:flutter/widgets.dart';

/// {@template exchange_coin_for_pass_scope_controller}
/// A controller that holds and operates the ExchangeCoinForPassScope.
/// {@endtemplate}
abstract interface class ExchangeCoinForPassController {
  /// Increment Counter.
  void incrementCounter();

  /// Decrement Counter.
  void decrementCounter();
}

/// {@template exchange_coin_for_pass_scope}
/// ExchangeCoinForPassScope widget.
/// {@endtemplate}
class ExchangeCoinForPassScope extends StatefulWidget {
  /// {@macro exchange_coin_for_pass_scope}
  const ExchangeCoinForPassScope({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  static _InheritedExchangeCoinForPassScope of(BuildContext context,
          {bool listen = true}) =>
      _InheritedExchangeCoinForPassScope.of(context, listen: listen);
  @override
  State<ExchangeCoinForPassScope> createState() =>
      _ExchangeCoinForPassScopeState();
}

/// State for widget ExchangeCoinForPassScope.
class _ExchangeCoinForPassScopeState extends State<ExchangeCoinForPassScope>
    implements ExchangeCoinForPassController {
  final TextEditingController controller = TextEditingController(text: '0');
  int amountRub = 0;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(ExchangeCoinForPassScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    controller.addListener(() {
      final int? amount = int.tryParse(controller.text);
      if (amount != null) {
        setState(() {
          amountRub = amount * 200;
        });
      } else {
        setState(() {
          amountRub = 0;
        });
      }
    });
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    controller.dispose();

    // Permanent removal of a tree stent
    super.dispose();
  }

  /* #endregion */

  @override
  Widget build(BuildContext context) => _InheritedExchangeCoinForPassScope(
        state: this,
        child: widget.child,
      );

  @override
  void incrementCounter() {
    int currentValue = int.tryParse(controller.text) ?? 0;
    controller.text = (currentValue + 1).toString();
    setState(() {
      amountRub = (currentValue + 1) * 200;
    });
  }

  @override
  void decrementCounter() {
    int currentValue = int.tryParse(controller.text) ?? 0;
    if (currentValue == 0) return;
    controller.text = (currentValue - 1).toString();
    setState(() {
      amountRub = (currentValue - 1) * 200;
    });
  }
}

/// Inherited widget for quick access in the element tree.
class _InheritedExchangeCoinForPassScope extends InheritedWidget {
  const _InheritedExchangeCoinForPassScope({
    required this.state,
    required super.child,
  });

  final _ExchangeCoinForPassScopeState state;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// For example: `ExchangeCoinForPassScope.maybeOf(context)`.
  static _InheritedExchangeCoinForPassScope? maybeOf(BuildContext context,
          {bool listen = true}) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<
              _InheritedExchangeCoinForPassScope>()
          : context
              .getElementForInheritedWidgetOfExactType<
                  _InheritedExchangeCoinForPassScope>()
              ?.widget as _InheritedExchangeCoinForPassScope?;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedExchangeCoinForPassScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// For example: `ExchangeCoinForPassScope.of(context)`.
  static _InheritedExchangeCoinForPassScope of(BuildContext context,
          {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(
          covariant _InheritedExchangeCoinForPassScope oldWidget) =>
      !identical(state, oldWidget) || state != oldWidget.state;
}
