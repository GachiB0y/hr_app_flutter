import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:hr_app_flutter/core/model/image.dart';
import 'package:image_picker/image_picker.dart';

/// {@template user_scope}
/// UserScope widget.
/// {@endtemplate}
class UserScope extends StatefulWidget {
  /// {@macro user_scope}
  const UserScope({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  static _UserScopeState? maybeOf(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<_InheritedUserScope>()
          ?.state;
    } else {
      final inheritedWidget = context
          .getElementForInheritedWidgetOfExactType<_InheritedUserScope>()
          ?.widget;
      return inheritedWidget is _InheritedUserScope
          ? inheritedWidget.state
          : null;
    }
  }

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedUserScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// For example: `UserScope.of(context)`.
  static _UserScopeState of(BuildContext context, {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();

  @override
  State<UserScope> createState() => _UserScopeState();
}

/// State for widget UserScope.
class _UserScopeState extends State<UserScope> {
  bool _isSave = false;
  File? file;
  final MyImage _myImage = MyImage();
  bool _isChangeTags = false;

  bool get isSave => _isSave;

  MyImage get myImage => _myImage;
  bool get isChangeTags => _isChangeTags;

  void changeIsSave({required bool newValue, required bool isTags}) {
    if (isSave != newValue) {
      setState(() {
        _isSave = newValue;
        _isChangeTags = isTags;
      });
    }
  }

  Future<void> selectImage() async {
    await myImage.pickImage(ImageSource.gallery);
  }

  @override
  void initState() {
    super.initState();
    // Initial state initialization
    // modelProfile = TestUserProfileWidgetModel();
  }

  @override
  void didUpdateWidget(UserScope oldWidget) {
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
  Widget build(BuildContext context) => _InheritedUserScope(
        state: this,
        child: widget.child,
      );
}

/// Inherited widget for quick access in the element tree.
class _InheritedUserScope extends InheritedWidget {
  const _InheritedUserScope({
    required this.state,
    required super.child,
  });

  final _UserScopeState state;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// For example: `UserScope.maybeOf(context)`.
  static _InheritedUserScope? maybeOf(BuildContext context,
          {bool listen = true}) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<_InheritedUserScope>()
          : context
              .getElementForInheritedWidgetOfExactType<_InheritedUserScope>()
              ?.widget as _InheritedUserScope?;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedUserScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// For example: `UserScope.of(context)`.
  static _InheritedUserScope of(BuildContext context, {bool listen = true}) =>
      maybeOf(context, listen: listen) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant _InheritedUserScope oldWidget) =>
      !identical(state, oldWidget) || state != oldWidget.state;
}
