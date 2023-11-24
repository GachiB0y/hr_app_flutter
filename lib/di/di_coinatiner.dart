// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:hr_app_flutter/domain/api_client/api_client.dart';
import 'package:hr_app_flutter/domain/api_client/auth_api_client.dart';
import 'package:hr_app_flutter/domain/api_client/event_entity_api_client.dart';
import 'package:hr_app_flutter/domain/api_client/service_api_client.dart';
import 'package:hr_app_flutter/domain/api_client/statement_provider.dart';
import 'package:hr_app_flutter/domain/api_client/user_api_client.dart';
import 'package:hr_app_flutter/domain/api_client/wallet_api_client.dart';
import 'package:hr_app_flutter/domain/blocs/auth_cubit/auth_cubit.dart';
import 'package:hr_app_flutter/domain/blocs/caregory_bloc.dart/category_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/coins_screen_view_model_bloc/coins_screen_view_model_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/loader_cubit/loader_view_cubit.dart';
import 'package:hr_app_flutter/domain/blocs/main_app_screen_view_cubit/main_app_screen_view_cubit.dart';
import 'package:hr_app_flutter/domain/blocs/rookies_bloc/rookies_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/service_bloc/service_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:hr_app_flutter/domain/data_provider/session_data_provider.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/event_entity_repo.dart';
import 'package:hr_app_flutter/domain/repository/lean_production_repository.dart';
import 'package:hr_app_flutter/domain/repository/service_repository.dart';
import 'package:hr_app_flutter/domain/repository/statements_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';
import 'package:hr_app_flutter/domain/repository/wallet_repository.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/library/flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hr_app_flutter/main.dart';
import 'package:hr_app_flutter/my_app.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/theme/color_schemes.g.dart';

AppFactory makeAppFactory() => const _AppFactoryDefault();

class _AppFactoryDefault implements AppFactory {
  final _diContainer = const _DIContainer();

  const _AppFactoryDefault();

  @override
  Widget makeApp() => MyApp(
        screenFactory: _diContainer._makeScreenFactory(),
      );
}

class _DIContainer {
  const _DIContainer();

  static const SecureStorageDefault secureStorageDefault =
      SecureStorageDefault();

  static const IHTTPService htttpService = HTTPServiceImpl();

  ScreenFactoryDefault _makeScreenFactory() => ScreenFactoryDefault(this);

  SessionDataProvdier _makeSessionDataProvdier() =>
      const SessionDataProvdierDefault(secureStorage: secureStorageDefault);
  IAuthProvider _makeAuthProvider() => const AuthProviderImpl(htttpService);
  IServiceProvider _makeServiceProvider() => ServiceProviderImpl(htttpService);
  IEventsEntityProvider _makeEventsEntityProvider() =>
      const EventsEntityProviderImpl(htttpService);
  IWalletProvider _makeWalletProvider() => WalletProviderImpl(htttpService);
  IStatementsProvider _makeStatementsProvider() =>
      StatementProviderImpl(htttpService);
  IUserProvider _makeUserProvider() => UserProviderImpl(htttpService);
  IEventEntityRepository _makeEventEntityRepository() =>
      EventEntityRepositoryImpl(
          eventEntityProvider: _makeEventsEntityProvider());
  IWalletRepository _makeWalletRepository() =>
      WalletRepositoryImpl(walletProvider: _makeWalletProvider());

  IUserRepository _makeUserRepository() =>
      UserRepositoryImpl(userProvider: _makeUserProvider());
  StatementsRepository _makeStatementsRepository() =>
      StatementsRepository(statementsProvider: _makeStatementsProvider());
  ILeanProductionRepository _makeLeanProductionRepository() =>
      LeanProductionRepositoryImpl(serviceProvider: _makeServiceProvider());
  IServiceRepository _makeServiceRepository() =>
      ServiceRepositoryImpl(serviceProvider: _makeServiceProvider());
  IAuthRepository _makeAuthRepository() => AuthRepositoryImpl(
      authProvider: _makeAuthProvider(),
      sessionDataProvdier: _makeSessionDataProvdier());
}

class ScreenFactoryDefault implements ScreenFactory {
  final _DIContainer _diContainer;
  final AppRouter _router = AppRouter();
  ScreenFactoryDefault(_DIContainer diContainer) : _diContainer = diContainer;

  @override
  MultiBlocProvider createMultiBlocProvider() {
    final IAuthRepository authRepository = _diContainer._makeAuthRepository();
    final IUserRepository userRepository = _diContainer._makeUserRepository();

    final IEventEntityRepository eventEntityRepository =
        _diContainer._makeEventEntityRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<MainAppScreenViewCubit>(
          create: (BuildContext context) => MainAppScreenViewCubit(),
        ),
        BlocProvider<EventEntityBloc>(
          create: (BuildContext context) => EventEntityBloc(
              eventEntityRepository: eventEntityRepository,
              authRepository: authRepository),
        ),
        BlocProvider<WalletBLoC>(
          create: (BuildContext context) => WalletBLoC(
              walletRepo: _diContainer._makeWalletRepository(),
              authRepository: authRepository),
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(
            userRepo: userRepository,
            authRepository: authRepository,
          ),
        ),
        BlocProvider<UserBirthDayInfoBLoc>(
          create: (BuildContext context) => UserBirthDayInfoBLoc(
              userRepo: userRepository, authRepository: authRepository),
        ),
        BlocProvider<RookiesBLoC>(
          create: (BuildContext context) => RookiesBLoC(
              userRepo: userRepository, authRepository: authRepository),
        ),
        BlocProvider<AuthViewCubit>(
          create: (BuildContext context) =>
              AuthViewCubit(authRepository: authRepository),
        ),
        BlocProvider<LoaderViewCubit>(
          create: (BuildContext context) =>
              LoaderViewCubit(authRepository: authRepository),
        ),
        BlocProvider<CoinsScreenViewModelBloc>(
          create: (BuildContext context) => CoinsScreenViewModelBloc(
            authRepository: authRepository,
            walletRepo: _diContainer._makeWalletRepository(),
          ),
        ),
        BlocProvider<CategoryBloc>(
          create: (BuildContext context) => CategoryBloc(
            authRepository: authRepository,
            eventEntityRepository: eventEntityRepository,
          ),
        ),
        BlocProvider<ServiceBloc>(
          create: (BuildContext context) => ServiceBloc(
            authRepository: authRepository,
            serviceRepository: _diContainer._makeServiceRepository(),
          ),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<StatementsRepository>(
              create: (context) => _diContainer._makeStatementsRepository()),
          RepositoryProvider<ILeanProductionRepository>(
              create: (context) =>
                  _diContainer._makeLeanProductionRepository()),
          RepositoryProvider<IAuthRepository>(
              create: (context) => authRepository),
          RepositoryProvider<IUserRepository>(
              create: (context) => userRepository),
          RepositoryProvider<IEventEntityRepository>(
              create: (context) => eventEntityRepository),
        ],
        child: MaterialApp.router(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'HR App',
          theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
          darkTheme:
              ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
          routerConfig: _router.config(),
        ),
      ),
    );
  }

  @override
  IAuthRepository makeAuthRepo() {
    return _diContainer._makeAuthRepository();
  }

  @override
  AppRouter makeAppRouter() {
    return AppRouter();
  }
}
