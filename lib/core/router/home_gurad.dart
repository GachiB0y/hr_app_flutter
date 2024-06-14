import 'dart:async';

import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:octopus/octopus.dart';

/// Do not allow any nested routes at `home` inderectly except of `*-tab`.
class HomeGuard extends OctopusGuard {
  HomeGuard();

  static final String _userMainTab = '${Routes.userMain.name}-tab';
  // static final String _basketTab = '${homeTabsEnum.basket.name}-tab';

  @override
  FutureOr<OctopusState> call(
    List<OctopusHistoryEntry> history,
    OctopusState$Mutable state,
    Map<String, Object?> context,
  ) {
    final home = state.findByName(Routes.home.name);
    if (home == null) return state; // Do nothing if `home` not found.

    // Remove all nested routes except of `*-tab`.
    home.removeWhere(
      (node) => node.name != _userMainTab,
      // && node.name != _basketTab,
      recursive: false,
    );
    // Upsert catalog tab node if not exists.
    final userMain =
        home.putIfAbsent(_userMainTab, () => OctopusNode.mutable(_userMainTab));
    if (!userMain.hasChildren) {
      userMain.add(OctopusNode.mutable(Routes.userMain.name));
    }
    // // Upsert basket tab node if not exists.
    // final basket =
    //     home.putIfAbsent(_basketTab, () => OctopusNode.mutable(_basketTab));
    // if (!basket.hasChildren)
    //   basket.add(OctopusNode.mutable(Routes.basket.name));

    return state;
  }
}
