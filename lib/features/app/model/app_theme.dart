import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// {@template app_theme}
/// An immutable class that holds properties needed
/// to build a [ThemeData] for the app.
/// {@endtemplate}
@immutable
final class AppTheme with Diagnosticable {
  /// {@macro app_theme}
  AppTheme({required this.mode, required this.seed})
      : darkTheme = ThemeData(
          colorScheme: darkColorScheme,
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        lightTheme = ThemeData(
          colorScheme: lightColorScheme,
          brightness: Brightness.light,
          useMaterial3: true,
        );

  /// The type of theme to use.
  final ThemeMode mode;

  /// The seed color to generate the [ColorScheme] from.
  final Color seed;

  /// The dark [ThemeData] for this [AppTheme].
  final ThemeData darkTheme;

  /// The light [ThemeData] for this [AppTheme].
  final ThemeData lightTheme;

  /// The default [AppTheme].
  static final defaultTheme = AppTheme(
    mode: ThemeMode.system,
    seed: const Color(0xFF56BE64),
  );

  /// The [ThemeData] for this [AppTheme].
  /// This is computed based on the [mode].
  ThemeData computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark
            ? darkTheme
            : lightTheme;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('seed', seed));
    properties.add(EnumProperty<ThemeMode>('type', mode));
    properties.add(DiagnosticsProperty<ThemeData>('lightTheme', lightTheme));
    properties.add(DiagnosticsProperty<ThemeData>('darkTheme', darkTheme));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppTheme &&
          runtimeType == other.runtimeType &&
          seed == other.seed &&
          mode == other.mode;

  @override
  int get hashCode => mode.hashCode ^ seed.hashCode;
}

final lightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  primary: const Color(0xFF56BE64),
  onPrimary: const Color(0xFFFFFFFF),
  primaryContainer: const Color(0xFF90FA98),
  onPrimaryContainer: const Color(0xFF002106),
  secondary: const Color(0xFF74DD7E),
  onSecondary: const Color(0xFFFFFFFF),
  secondaryContainer: const Color(0xFF90FA98),
  onSecondaryContainer: const Color(0xFF002106),
  tertiary: const Color(0xFF74DD7E),
  onTertiary: const Color(0xFFFFFFFF),
  tertiaryContainer: const Color(0xFF90FA98),
  onTertiaryContainer: const Color(0xFF002106),
  error: const Color(0xFFBA1A1A),
  errorContainer: const Color(0xFFFFDAD6),
  onError: const Color(0xFFFFFFFF),
  onErrorContainer: const Color(0xFF410002),
  background: const Color.fromRGBO(238, 238, 238, 1),
  onBackground: const Color(0xFF002107),
  surface: const Color(0xFF74DD7E),
  onSurface: const Color(0xFF002107),
  surfaceVariant: const Color(0xFFDEE5D9),
  onSurfaceVariant: const Color.fromARGB(255, 0, 0, 0),
  outline: const Color(0xFF72796F),
  onInverseSurface: const Color.fromARGB(255, 0, 0, 0),
  inverseSurface: const Color.fromARGB(255, 71, 76, 72),
  inversePrimary: const Color(0xFF74DD7E),
  shadow: const Color(0xFF000000),
  surfaceTint: const Color(0xFF74DD7E),
  outlineVariant: const Color(0xFFC2C9BD),
  scrim: const Color(0xFF000000),
  seedColor: const Color(0xFF56BE64),
);

final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  primary: const Color(0xFF56BE64),
  onPrimary: const Color(0xFFFFFFFF),
  primaryContainer: const Color(0xFF00531B),
  onPrimaryContainer: const Color(0xFF90FA98),
  secondary: const Color(0xFF74DD7E),
  onSecondary: const Color(0xFF003910),
  secondaryContainer: const Color(0xFF00531B),
  onSecondaryContainer: const Color(0xFF90FA98),
  tertiary: const Color(0xFF74DD7E),
  onTertiary: const Color(0xFF003910),
  tertiaryContainer: const Color(0xFF00531B),
  onTertiaryContainer: const Color(0xFF90FA98),
  error: const Color(0xFFFFB4AB),
  errorContainer: const Color(0xFF93000A),
  onError: const Color(0xFF690005),
  onErrorContainer: const Color(0xFFFFDAD6),
  background: const Color.fromARGB(255, 34, 36, 34),
  onBackground: const Color.fromARGB(255, 84, 237, 94),
  surface: const Color(0xFF002107),
  onSurface: const Color.fromARGB(255, 89, 243, 100),
  surfaceVariant: const Color.fromARGB(255, 255, 255, 255),
  onSurfaceVariant: const Color.fromARGB(255, 211, 213, 209),
  outline: const Color(0xFF8C9389),
  onInverseSurface: const Color(0xFF002107),
  inverseSurface: const Color(0xFFA4F5A9),
  inversePrimary: const Color(0xFF006E26),
  shadow: const Color(0xFF000000),
  surfaceTint: const Color(0xFF74DD7E),
  outlineVariant: const Color(0xFF424940),
  scrim: const Color(0xFF000000),
  seedColor: const Color(0xFF56BE64),
);
