import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hr_app_flutter/core/components/rest_clients/firebase_api/firebase_api.dart';
import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:hr_app_flutter/core/components/rest_clients/src/rest_client_dio.dart';
import 'package:hr_app_flutter/core/environment/environment_configuration.dart';
import 'package:hr_app_flutter/core/utils/logger.dart';
import 'package:hr_app_flutter/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/auth/data/rest_clients/auth_datasource.dart';
import 'package:hr_app_flutter/features/auth/data/rest_clients/refresh_client.dart';
import 'package:hr_app_flutter/features/initialiazation/model/initialization_progress.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';
import 'package:hr_app_flutter/features/news/data/rest_clients/event_entity_api_client.dart';
import 'package:hr_app_flutter/features/schedule_bus/data/schedule_bus_api_client.dart';
import 'package:hr_app_flutter/features/schedule_bus/data/schedule_bus_repository.dart';
import 'package:hr_app_flutter/features/services/data/repo/lean_production_repository.dart';
import 'package:hr_app_flutter/features/services/data/repo/service_repository.dart';
import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';
import 'package:hr_app_flutter/features/settings/data/locale_datasource.dart';
import 'package:hr_app_flutter/features/settings/data/settings_repository.dart';
import 'package:hr_app_flutter/features/settings/data/theme_datasource.dart';
import 'package:hr_app_flutter/features/settings/data/theme_mode_codec.dart';
import 'package:hr_app_flutter/features/statements/data/repo/statements_repository.dart';
import 'package:hr_app_flutter/features/statements/data/rest_clietns/statement_provider.dart';
import 'package:hr_app_flutter/features/user/bloc/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:hr_app_flutter/features/user/data/rest_clients/user_api_client.dart';
import 'package:hr_app_flutter/features/wallet/data/repo/wallet_repository.dart';
import 'package:hr_app_flutter/features/wallet/data/rest_clients/wallet_api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A function which represents a single initialization step.
typedef StepAction = FutureOr<void>? Function(InitializationProgress progress);

/// The initialization steps, which are executed in the order they are defined.
///
/// The [Dependencies] object is passed to each step, which allows the step to
/// set the dependency, and the next step to use it.
mixin InitializationSteps {
  /// The initialization steps,
  /// which are executed in the order they are defined.
  final initializationSteps = <String, StepAction>{
    'Shared Preferences': (progress) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      progress.dependencies.sharedPreferences = sharedPreferences;
    },
    'Settings Repository': (progress) {
      final sharedPreferences = progress.dependencies.sharedPreferences;
      final themeDataSource = ThemeDataSourceImpl(
        sharedPreferences: sharedPreferences,
        codec: const ThemeModeCodec(),
      );
      final localeDataSource = LocaleDataSourceImpl(
        sharedPreferences: sharedPreferences,
      );
      progress.dependencies.settingsRepository = SettingsRepositoryImpl(
        themeDataSource: themeDataSource,
        localeDataSource: localeDataSource,
      );
    },
    'Environment Configuration': (progress) {
      final environmentConfiguration =
          EnvironmentConfiguration.fromEnvironmentVariables();
      if (kDebugMode || kProfileMode) {
        debugPrint(
            'environment: ${EnvironmentConfiguration.environment.name}\nurl: ${EnvironmentConfiguration.baseUrl}');
      }

      progress.dependencies.environmentConfiguration = environmentConfiguration;
    },
    'Firebase API': (progress) {
      final firebaseApi = FirebaseApi();
      firebaseApi.initNotifications();
      progress.dependencies.firebaseApi = firebaseApi;
    },
    'AuthRepository': (progress) async {
      final interceptedDio = Dio();
      final baseUrl = EnvironmentConfiguration.baseUrl;
      final justDio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      final restClient = RestClientDio(
        baseUrl: baseUrl,
        dio: interceptedDio,
      );
      final authDataSource = AuthDataSourceImpl(
        client: justDio,
        sharedPreferences: progress.dependencies.sharedPreferences,
      );

      final refreshClient = RefreshClientImpl(client: justDio);

      final oauthInterceptor = OAuthInterceptor(
        storage: authDataSource,
        refreshClient: refreshClient,
      );
      interceptedDio.interceptors.add(oauthInterceptor);

      final authRepository = AuthRepositoryImpl(
          authStatusDataSource: oauthInterceptor,
          authDataSource: authDataSource,
          firebaseApi: progress.dependencies.firebaseApi);

      progress.dependencies.authRepository = authRepository;
      progress.dependencies.restClient = restClient;
    },
    'UserRepository': (progress) async {
      final userProvider = UserProviderImpl(progress.dependencies.restClient);

      final userRepository = UserRepositoryImpl(userProvider: userProvider);

      progress.dependencies.userRepository = userRepository;
    },
    'EventEntityRepository': (progress) async {
      final eventEntityProvider =
          EventsEntityProviderImpl(progress.dependencies.restClient);

      final eventEntityRepository =
          EventEntityRepositoryImpl(eventEntityProvider: eventEntityProvider);

      progress.dependencies.eventEntityRepository = eventEntityRepository;
    },
    'ServiceRepository': (progress) async {
      final serviceProvider =
          ServiceProviderImpl(progress.dependencies.restClient);

      final serviceRepository =
          ServiceRepositoryImpl(serviceProvider: serviceProvider);

      progress.dependencies.serviceRepository = serviceRepository;
      progress.dependencies.serviceProvider = serviceProvider;
    },
    'WalletRepository': (progress) async {
      final walletProvider =
          WalletProviderImpl(progress.dependencies.restClient);

      final walletRepository =
          WalletRepositoryImpl(walletProvider: walletProvider);

      progress.dependencies.walletRepository = walletRepository;
    },
    'StatementsRepository': (progress) async {
      final statementProvider =
          StatementProviderImpl(progress.dependencies.restClient);

      final statementsRepository =
          StatementsRepositoryImpl(statementsProvider: statementProvider);

      progress.dependencies.statementsRepository = statementsRepository;
    },
    'LeanProductionRepository': (progress) async {
      final leanProductionRepository = LeanProductionRepositoryImpl(
          serviceProvider: progress.dependencies.serviceProvider);

      progress.dependencies.leanProductionRepository = leanProductionRepository;
    },
    'ScheduleBusRepository': (progress) async {
      final scheduleBusProvider =
          ScheduleBusProviderImpl(progress.dependencies.restClient);

      final scheduleBusRepository =
          ScheduleBusRepositoryImpl(scheduleBusProvider: scheduleBusProvider);

      progress.dependencies.scheduleBusRepository = scheduleBusRepository;
    },
    'AuthBloc': (progress) async {
      final authRepository = progress.dependencies.authRepository;
      final authBloc = AuthBLoC(authRepository: authRepository);
      final resolvedState = await authBloc.stream
          .where((event) => event.data != AuthenticationStatus.initial)
          .first;
      logger.verbose('Resolved auth state: $resolvedState');
      progress.dependencies.authBloc = authBloc;
    },
    'UserBloc': (progress) async {
      final userRepository = progress.dependencies.userRepository;
      final userBloc = UserBloc(userRepo: userRepository);

      progress.dependencies.userBloc = userBloc;
    },
  };
}
