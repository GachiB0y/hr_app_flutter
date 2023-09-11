import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/api_client/auth_api_client.dart';
import 'package:hr_app_flutter/domain/api_client/event_entity_api_client.dart';
import 'package:hr_app_flutter/domain/api_client/user_api_client.dart';
import 'package:hr_app_flutter/domain/api_client/wallet_api_client.dart';
import 'package:hr_app_flutter/domain/blocs/auth_cubit/auth_cubit.dart';
import 'package:hr_app_flutter/domain/blocs/coins_screen_view_model_bloc/coins_screen_view_model_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/event_entity_cubit/event_entity_cubit.dart';
import 'package:hr_app_flutter/domain/blocs/loader_cubit/loader_view_cubit.dart';
import 'package:hr_app_flutter/domain/blocs/main_app_screen_view_cubit/main_app_screen_view_cubit.dart';
import 'package:hr_app_flutter/domain/blocs/other_users_bloc/other_users_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:hr_app_flutter/domain/data_provider/session_data_provider.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/event_entity_repo.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';
import 'package:hr_app_flutter/domain/repository/wallet_repository.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/library/flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hr_app_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:hr_app_flutter/my_app.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

  ScreenFactoryDefault _makeScreenFactory() => ScreenFactoryDefault(this);

  SessionDataProvdier _makeSessionDataProvdier() =>
      const SessionDataProvdierDefault(secureStorage: secureStorageDefault);
  AuthProvider _makeAuthProvider() => const AuthProviderImpl();
  EventsEntityProvider _makeEventsEntityProvider() =>
      const EventEntityApiClient(); //EventEntityApiClient ЗАМЕНИТЬ НА EventsEntityProviderImpl ПРИ ПОЛУЧСЕНИИ НОВЫОГО СПИСКА НОВОСТЕЙ
  WalletProvider _makeWalletProvider() => const WalletProviderImpl();
  UserProvider _makeUserProvider() => const UserProviderImpl();
  EventEntityRepository _makeEventEntityRepository() =>
      EventEntityRepositoryImpl(
          eventEntityProvider: _makeEventsEntityProvider());
  WalletRepository _makeWalletRepository() =>
      WalletRepositoryImpl(walletProvider: _makeWalletProvider());

  UserRepository _makeUserRepository() =>
      UserRepositoryImpl(userProvider: _makeUserProvider());
  AuthRepository _makeAuthRepository() => AuthRepositoryImpl(
      authProvider: _makeAuthProvider(),
      sessionDataProvdier: _makeSessionDataProvdier());
}

class ScreenFactoryDefault implements ScreenFactory {
  final _DIContainer _diContainer;
  final AppRouter _router = AppRouter();
  ScreenFactoryDefault(this._diContainer);

  @override
  MultiBlocProvider createMultiBlocProvider() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainAppScreenViewCubit>(
          create: (BuildContext context) => MainAppScreenViewCubit(),
        ),
        BlocProvider<EventEntityCubit>(
          create: (BuildContext context) => EventEntityCubit(
              eventEntityRepository: _diContainer._makeEventEntityRepository()),
        ),
        BlocProvider<WalletBloc>(
          create: (BuildContext context) => WalletBloc(
              walletRepo: _diContainer._makeWalletRepository(),
              authRepository: _diContainer._makeAuthRepository()),
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(
              userRepo: _diContainer._makeUserRepository(),
              authRepository: _diContainer._makeAuthRepository()),
        ),
        BlocProvider<AuthViewCubit>(
          create: (BuildContext context) =>
              AuthViewCubit(authRepository: _diContainer._makeAuthRepository()),
        ),
        BlocProvider<LoaderViewCubit>(
          create: (BuildContext context) => LoaderViewCubit(
              authRepository: _diContainer._makeAuthRepository()),
        ),
        BlocProvider<OtherUsersBloc>(
          create: (BuildContext context) => OtherUsersBloc(
              authRepository: _diContainer._makeAuthRepository(),
              userRepo: _diContainer._makeUserRepository()),
        ),
        BlocProvider<CoinsScreenViewModelBloc>(
          create: (BuildContext context) => CoinsScreenViewModelBloc(
            authRepository: _diContainer._makeAuthRepository(),
            walletRepo: _diContainer._makeWalletRepository(),
          ),
        ),
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
        theme: ThemeData(
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.red[200]),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        routerConfig: _router.config(),
      ),
    );
  }
}
