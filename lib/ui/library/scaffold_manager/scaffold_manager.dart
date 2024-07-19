library scaffold_manager_tg;

import 'package:flutter/material.dart';
import 'package:hr_app_flutter/ui/commons/app_progress_indicator.dart';


part 'src/scaffold_manager_data.dart';

part 'src/scaffold_manager_helper.dart';

/// Базовый виджет экрана
class ScaffoldManager extends StatelessWidget {
  /// Статус загрузки экрана
  final ScaffoldManagerStatus status;

  /// Виджет тела экрана
  final Widget body;

  /// appBar
  final PreferredSizeWidget? appBar;

  /// backgroundColor
  final Color? backgroundColor;

  /// Реагировать ли на открытие клавиатуры
  final bool? resizeToAvoidBottomInset;

  /// floatingActionButton
  final Widget? floatingActionButton;

  const ScaffoldManager({
    required this.status,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar,
        backgroundColor: backgroundColor,
        body: _ScaffoldManagerHelper._getChild(status, body),
        floatingActionButton: status == ScaffoldManagerStatus.loaded
            ? floatingActionButton
            : const SizedBox.shrink(),
      );
}
