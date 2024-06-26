import 'package:flutter/foundation.dart';

late EnvironmentConfiguration environmentConfiguration;

class EnvironmentConfiguration {
  static EnvironmentType get environment => _environment;
  static String get baseUrl => _baseUrl;

  static set setEnvironment(EnvironmentType environment) {
    _environment = environment;
  }

  static set setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }

  static late EnvironmentType _environment;
  static late String _baseUrl;

  EnvironmentConfiguration({
    required EnvironmentType environment,
    required String baseUrl,
  }) {
    _environment = environment;
    _baseUrl = baseUrl;
  }

  factory EnvironmentConfiguration.fromEnvironmentVariables() =>
      EnvironmentConfiguration(
        environment: EnvironmentType.fromString(
          const String.fromEnvironment('environment',
              defaultValue: !kReleaseMode
                  ? (kDebugMode ? 'development' : 'staging')
                  : 'production'),
        ),
        baseUrl: const String.fromEnvironment(
          'url',
          defaultValue:
          // !kReleaseMode
          //     ? (kDebugMode
          //         ? 'http://grass-test-api.grass.local/'
          //         : 'http://grass-test-api.grass.local/')
          //     :
          'https://grass-app-api.grass.su/',
        ),
      );
}

enum EnvironmentType {
  development,
  staging,
  production;

  factory EnvironmentType.fromString(String string) {
    switch (string) {
      case 'development':
        return EnvironmentType.development;
      case 'staging':
        return EnvironmentType.staging;
      case 'production':
        return EnvironmentType.production;
      default:
        throw Exception('Invalid environment type');
    }
  }
}

void configureEnvironment() {
  environmentConfiguration =
      EnvironmentConfiguration.fromEnvironmentVariables();
  if (kDebugMode || kProfileMode) {
    debugPrint(
        'environment: ${EnvironmentConfiguration.environment.name}\nurl: ${EnvironmentConfiguration.baseUrl}');
  }
}
