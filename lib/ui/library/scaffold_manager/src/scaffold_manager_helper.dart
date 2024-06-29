part of '../scaffold_manager.dart';

/// Реализация работы
class _ScaffoldManagerHelper {
  /// Получение дочернего виджета
  static _getChild(
    ScaffoldManagerStatus status,
    Widget child,
  ) {
    switch (status) {
      case ScaffoldManagerStatus.loading:
        return const Center(child: AppProgressIndicator());
      case ScaffoldManagerStatus.noData:
        return const SizedBox.shrink();
      case ScaffoldManagerStatus.errorNetWork:
        return const SizedBox.shrink();
      case ScaffoldManagerStatus.errorOther:
        return const SizedBox.shrink();
      case ScaffoldManagerStatus.loaded:
        return child;
    }
  }
}
