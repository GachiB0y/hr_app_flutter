import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/localization/localization.dart';
import 'package:hr_app_flutter/core/router/router_state_mixin.dart';
import 'package:hr_app_flutter/features/settings/widget/settings_scope.dart';

/// {@template material_context}
/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
/// {@endtemplate}
class MaterialContext extends StatefulWidget {
  /// {@macro material_context}
  const MaterialContext({super.key});

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext>
    with RouterStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = SettingsScope.themeOf(context).theme;

    final locale = SettingsScope.localeOf(context).locale;

    return MaterialApp.router(
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: theme.mode,
      localizationsDelegates: Localization.localizationDelegates,
      supportedLocales: Localization.supportedLocales,
      locale: locale,
      routerConfig: router.config,
      builder: (context, child) => MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!),
    );
  }
}
