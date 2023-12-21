import 'package:hr_app_flutter/core/components/database/data_provider/session_data_provider.dart';
import 'package:hr_app_flutter/core/components/database/rest_clients/api_client.dart';
import 'package:hr_app_flutter/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/home/bloc/main_app_screen_view_cubit/main_app_screen_view_cubit.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';
import 'package:hr_app_flutter/features/services/data/repo/lean_production_repository.dart';
import 'package:hr_app_flutter/features/services/data/repo/service_repository.dart';
import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';
import 'package:hr_app_flutter/features/settings/data/settings_repository.dart';
import 'package:hr_app_flutter/features/statements/data/repo/statements_repository.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:hr_app_flutter/features/wallet/data/repo/wallet_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template dependencies}
/// Dependencies container
/// {@endtemplate}
base class Dependencies {
  /// {@macro dependencies}
  Dependencies();

  /// Shared preferences
  late final SharedPreferences sharedPreferences;

  /// Theme repository
  late final SettingsRepository settingsRepository;

  /// HTTPService
  late final IHTTPService htttpService;

  /// serviceProvider

  late final IServiceProvider serviceProvider;

  /// SessionDataProvdier
  late final SessionDataProvdier sessionDataProvdier;

  /// IAuthRepository repository
  late final IAuthRepository authRepository;

  /// IUserRepository repository
  late final IUserRepository userRepository;

  /// IEventEntityRepository repository
  late final IEventEntityRepository eventEntityRepository;

  /// IServiceRepository repository
  late final IServiceRepository serviceRepository;

  /// IWalletRepository repository
  late final IWalletRepository walletRepository;

  /// StatementsRepository repository
  late final IStatementsRepository statementsRepository;

  /// ILeanProductionRepository repository
  late final ILeanProductionRepository leanProductionRepository;

  /// Authentication bloc
  late final AuthBLoC authBloc;

  ///MainAppScreenViewCubit
  late final MainAppScreenViewCubit mainAppScreenViewCubit;

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
