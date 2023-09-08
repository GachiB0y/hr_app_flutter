import 'package:flutter/material.dart';
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
import 'package:hr_app_flutter/router/router.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static const AuthProvider authProvider = AuthProviderImpl();
  static const SecureStorageDefault secureStorageDefault =
      SecureStorageDefault();
  static const SessionDataProvdier sessionDataProvdier =
      SessionDataProvdierDefault(secureStorage: secureStorageDefault);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRouter();
  final EventEntityRepository eventEntityRepository =
      EventEntityRepositoryImpl(eventEntityProvider: EventEntityApiClient());

  final WalletRepository walletRepository =
      WalletRepositoryImpl(walletProvider: WalletProviderImpl());

  final UserRepository userRepository =
      UserRepositoryImpl(userProvider: UserProviderImpl());

  final AuthRepository authRepository = AuthRepositoryImpl(
      authProvider: MyApp.authProvider,
      sessionDataProvdier: MyApp.sessionDataProvdier);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainAppScreenViewCubit>(
          create: (BuildContext context) => MainAppScreenViewCubit(),
        ),
        BlocProvider<EventEntityCubit>(
          create: (BuildContext context) =>
              EventEntityCubit(eventEntityRepository: eventEntityRepository),
        ),
        BlocProvider<WalletBloc>(
          create: (BuildContext context) => WalletBloc(
              walletRepo: walletRepository, authRepository: authRepository),
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(
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
        BlocProvider<OtherUsersBloc>(
          create: (BuildContext context) => OtherUsersBloc(
              authRepository: authRepository, userRepo: userRepository),
        ),
        BlocProvider<CoinsScreenViewModelBloc>(
          create: (BuildContext context) => CoinsScreenViewModelBloc(
            authRepository: authRepository,
            walletRepo: walletRepository,
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
