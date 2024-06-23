import 'dart:async';

import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:octopus/octopus.dart';

/// Do not allow any nested routes at `home` inderectly except of `*-tab`.
class HomeGuard extends OctopusGuard {
  HomeGuard();

  static final String _userMainTab = '${Routes.userMain.name}-tab';
  static final String _coinTab = '${Routes.coin.name}-tab';
  static final String _servicesTab = '${Routes.services.name}-tab';
  static final String _educationTab = '${Routes.education.name}-tab';
  static final String _companyTab = '${Routes.company.name}-tab';

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
      (node) =>
          node.name != _userMainTab &&
          node.name != _coinTab &&
          node.name != _servicesTab &&
          node.name != _educationTab &&
          node.name != _companyTab,
      recursive: false,
    );
    // Upsert userMain tab node if not exists.
    final userMain =
        home.putIfAbsent(_userMainTab, () => OctopusNode.mutable(_userMainTab));
    if (!userMain.hasChildren) {
      userMain.add(OctopusNode.mutable(Routes.userMain.name));
    }
    // Upsert coin tab node if not exists.
    final coin =
        home.putIfAbsent(_coinTab, () => OctopusNode.mutable(_coinTab));
    if (!coin.hasChildren) {
      coin.add(OctopusNode.mutable(Routes.coin.name));
    }

    // Upsert services tab node if not exists.
    final services =
        home.putIfAbsent(_servicesTab, () => OctopusNode.mutable(_servicesTab));
    if (!services.hasChildren) {
      services.add(OctopusNode.mutable(Routes.services.name));
    }

    // Upsert education tab node if not exists.
    final education = home.putIfAbsent(
        _educationTab, () => OctopusNode.mutable(_educationTab));
    if (!education.hasChildren) {
      education.add(OctopusNode.mutable(Routes.education.name));
    }

    // Upsert company tab node if not exists.
    final company =
        home.putIfAbsent(_companyTab, () => OctopusNode.mutable(_companyTab));
    if (!company.hasChildren) {
      company.add(OctopusNode.mutable(Routes.company.name));
    }

    return state;
  }
}
