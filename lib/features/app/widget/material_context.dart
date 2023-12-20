import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hr_app_flutter/core/localization/localization.dart';
import 'package:hr_app_flutter/features/auth/widget/auth_scope.dart';
import 'package:hr_app_flutter/core/localization/generated/l10n.dart';
import 'package:hr_app_flutter/features/settings/widget/settings_scope.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/theme/color_schemes.dart';

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

class _MaterialContextState extends State<MaterialContext> {
  late final auth = AuthScope.of(context);
  late final loggedIn = auth.authenticated;
  final AppRouter router = AppRouter();
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
      routerConfig: router.config(),
    );
  }
}
