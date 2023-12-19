import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hr_app_flutter/features/auth/widget/auth_scope.dart';
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
  late final auth = AuthScope.of(context);
  late final loggedIn = auth.authenticated;
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
        builder: (context, widget) {
          return widget!;
        }
        // routerDelegate: AutoRouterDelegate.declarative(
        //   router,
        //   routes: (_) => [
        //     // if the user is logged in, they may proceed to the main App
        //     if (AuthScope.of(context).authenticated)
        //       const MainAppRoute()
        //     // if they are not logged in, bring them to the Login page
        //     else
        //       const AuthenticationFormRoute(),
        //   ],
        // ),
        // routeInformationParser:
        //     router.defaultRouteParser(includePrefixMatches: true)
        );
  }
}
