import 'package:flutter/material.dart' show Locale;
import 'package:hr_app_flutter/features/app/model/app_theme.dart';
import 'package:hr_app_flutter/features/settings/data/locale_datasource.dart';
import 'package:hr_app_flutter/features/settings/data/theme_datasource.dart';

/// Settings repository
abstract interface class SettingsRepository {
  /// Set theme
  Future<void> setTheme(AppTheme theme);

  /// Set locale
  Future<void> setLocale(Locale locale);

  /// Observe theme mode changes
  AppTheme? fetchThemeFromCache();

  /// Observe locale changes
  Locale? fetchLocaleFromCache();
}

/// {@template settings_repository_impl}
/// Settings repository implementation
/// {@endtemplate}
final class SettingsRepositoryImpl implements SettingsRepository {
  /// {@macro settings_repository_impl}
  const SettingsRepositoryImpl({
    required ThemeDataSource themeDataSource,
    required LocaleDataSource localeDataSource,
  })  : _themeDataSource = themeDataSource,
        _localeDataSource = localeDataSource;

  final ThemeDataSource _themeDataSource;
  final LocaleDataSource _localeDataSource;

  @override
  Locale? fetchLocaleFromCache() => _localeDataSource.loadLocaleFromCache();

  @override
  AppTheme? fetchThemeFromCache() => _themeDataSource.loadThemeFromCache();

  @override
  Future<void> setLocale(Locale locale) => _localeDataSource.setLocale(locale);

  @override
  Future<void> setTheme(AppTheme theme) => _themeDataSource.setTheme(theme);
}
