import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
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
  final AppRouter router = AppRouter();
  @override
  Widget build(BuildContext context) {
    // final theme = SettingsScope.themeOf(context).theme;
    // final locale = SettingsScope.localeOf(context).locale;

    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'HR App',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      routerConfig: router.config(),
    );
  }
}
