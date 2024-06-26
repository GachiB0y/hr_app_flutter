import 'package:flutter/widgets.dart' show BuildContext;
import 'package:hr_app_flutter/core/components/rest_clients/firebase_api/firebase_api.dart';
import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:hr_app_flutter/core/environment/environment_configuration.dart';
import 'package:hr_app_flutter/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';
import 'package:hr_app_flutter/features/schedule_bus/data/schedule_bus_repository.dart';
import 'package:hr_app_flutter/features/services/data/repo/lean_production_repository.dart';
import 'package:hr_app_flutter/features/services/data/repo/service_repository.dart';
import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';
import 'package:hr_app_flutter/features/settings/data/settings_repository.dart';
import 'package:hr_app_flutter/features/statements/data/repo/statements_repository.dart';
import 'package:hr_app_flutter/features/user/bloc/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:hr_app_flutter/features/wallet/data/repo/wallet_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template dependencies}
/// Dependencies container
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}
  Dependencies();

  /// The state from the closest instance of this class.
  factory Dependencies.of(BuildContext context) =>
      DependenciesScope.of(context);

  /// Shared preferences
  late final SharedPreferences sharedPreferences;

  /// Theme repository
  late final SettingsRepository settingsRepository;

  /// Environment Configuration
  late final EnvironmentConfiguration environmentConfiguration;

  /// Firebase API
  late final IFirebaseApi firebaseApi;

  /// HTTPService
  // late final IHTTPService htttpService;

  /// serviceProvider
  late final IServiceProvider serviceProvider;

  /// IAuthRepository repository
  late final IAuthRepository authRepository;

  /// IUserRepository repository
  late final IUserRepository userRepository;

  /// IEventEntityRepository repository
  late final IEventEntityRepository eventEntityRepository;

  /// IServiceRepository repository
  late final IServiceRepository serviceRepository;

  /// IScheduleBusRepository repository
  late final IScheduleBusRepository scheduleBusRepository;

  /// IWalletRepository repository
  late final IWalletRepository walletRepository;

  /// StatementsRepository repository
  late final IStatementsRepository statementsRepository;

  /// ILeanProductionRepository repository
  late final ILeanProductionRepository leanProductionRepository;

  /// Authentication bloc
  late final AuthBLoC authBloc;

  /// User bloc
  late final UserBloc userBloc;

  ///REST Client
  late final RestClient restClient;

  // /// Theme repository
  // late final SettingsRepository settingsRepository;
}

/// {@template initialization_result}
/// Result of initialization
/// {@endtemplate}
final class InitializationResult {
  /// {@macro initialization_result}
  const InitializationResult({
    required this.dependencies,
    required this.stepCount,
    required this.msSpent,
  });

  /// The dependencies
  final Dependencies dependencies;

  /// The number of steps
  final int stepCount;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$InitializationResult('
      'dependencies: $dependencies, '
      'stepCount: $stepCount, '
      'msSpent: $msSpent'
      ')';
}
