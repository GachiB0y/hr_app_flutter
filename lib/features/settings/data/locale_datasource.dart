import 'dart:ui';

import 'package:hr_app_flutter/core/utils/preferences_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template locale_datasource}
/// [LocaleDataSource] is an entry point to the locale data layer.
///
/// This is used to set and get locale.
/// {@endtemplate}
abstract interface class LocaleDataSource {
  /// Set locale
  Future<void> setLocale(Locale locale);

  /// Get current locale from cache
  Locale? loadLocaleFromCache();
}

/// {@macro locale_datasource}
final class LocaleDataSourceImpl
    with PreferencesDao
    implements LocaleDataSource {
  /// {@macro locale_datasource}
  const LocaleDataSourceImpl({required this.sharedPreferences});

  @override
  final SharedPreferences sharedPreferences;

  PreferencesEntry<String> get _locale => stringEntry('settings.locale');

  @override
  Future<void> setLocale(Locale locale) async {
    await _locale.set(locale.languageCode);
  }

  @override
  Locale? loadLocaleFromCache() {
    final languageCode = _locale.read();

    if (languageCode == null) return null;

    return Locale.fromSubtags(languageCode: languageCode);
  }
}
