import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/auth/widget/auth_scope.dart';
import 'package:hr_app_flutter/features/home/bloc/main_app_screen_view_cubit/main_app_screen_view_cubit.dart';
import 'package:hr_app_flutter/features/initialiazation/model/dependencies.dart';
import 'package:hr_app_flutter/features/news/bloc/caregory_bloc.dart/category_bloc.dart';
import 'package:hr_app_flutter/features/news/bloc/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/features/services/bloc/rookies_bloc/rookies_bloc.dart';
import 'package:hr_app_flutter/features/services/bloc/service_bloc/service_bloc.dart';
import 'package:hr_app_flutter/features/services/bloc/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';
import 'package:hr_app_flutter/features/settings/widget/settings_scope.dart';
import 'package:hr_app_flutter/features/user/bloc/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/features/wallet/bloc/wallet_bloc/wallet_bloc.dart';

import '../../initialiazation/widget/dependencies_scope.dart';
import 'material_context.dart';

/// {@template app}
/// [App] is an entry point to the application.
///
/// All the global scopes should be defined there.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({required this.result, super.key});

  /// Running this function will result in attaching
  /// corresponding [RenderObject] to the root of the tree.
  void attach([VoidCallback? callback]) {
    callback?.call();
    runApp(this);
  }

  /// The initialization result from the [InitializationProcessor]
  final InitializationResult result;

  @override
  Widget build(BuildContext context) => DependenciesScope(
        dependencies: result.dependencies,
        child: MultiBlocProvider(
            providers: [
              BlocProvider<MainAppScreenViewCubit>(
                create: (BuildContext context) => MainAppScreenViewCubit(),
              ),
              BlocProvider<EventEntityBloc>(
                create: (BuildContext context) => EventEntityBloc(
                  eventEntityRepository:
                      DependenciesScope.of(context).eventEntityRepository,
                ),
              ),
              BlocProvider<WalletBLoC>(
                create: (BuildContext context) => WalletBLoC(
                  walletRepo: DependenciesScope.of(context).walletRepository,
                ),
              ),
              BlocProvider<UserBloc>(
                create: (BuildContext context) => UserBloc(
                  userRepo: DependenciesScope.of(context).userRepository,
                ),
              ),
              BlocProvider<UserBirthDayInfoBLoc>(
                create: (BuildContext context) => UserBirthDayInfoBLoc(
                  userRepo: DependenciesScope.of(context).userRepository,
                ),
              ),
              BlocProvider<RookiesBLoC>(
                create: (BuildContext context) => RookiesBLoC(
                  userRepo: DependenciesScope.of(context).userRepository,
                ),
              ),
              BlocProvider<CategoryBloc>(
                create: (BuildContext context) => CategoryBloc(
                  eventEntityRepository:
                      DependenciesScope.of(context).eventEntityRepository,
                ),
              ),
              BlocProvider<ServiceBloc>(
                create: (BuildContext context) => ServiceBloc(
                  serviceRepository:
                      DependenciesScope.of(context).serviceRepository,
                ),
              ),
            ],
            child: const SettingsScope(
                child: AuthScope(child: MaterialContext()))),
      );
}
