import 'package:flutter/material.dart';

class ChangeNotifierProvaider<T extends Listenable>
    extends InheritedNotifier<T> {
  final T? model;
  const ChangeNotifierProvaider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, child: child, notifier: model);

  static T? watch<M extends ChangeNotifierProvaider<T>, T extends Listenable>(
      BuildContext context) {
    final notifier = context.dependOnInheritedWidgetOfExactType<M>()?.notifier;
    if (notifier != null) {
      return notifier;
    }
    return null;
  }

  static T? read<M extends ChangeNotifierProvaider<T>, T extends Listenable>(
      BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<M>()?.widget;
    return widget is ChangeNotifierProvaider ? widget.notifier as T : null;
  }
}
