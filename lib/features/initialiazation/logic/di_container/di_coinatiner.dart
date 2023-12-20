// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:hr_app_flutter/core/localization/generated/l10n.dart';
// import 'package:hr_app_flutter/features/auth/data/rest_clients/auth_api_client.dart';
// import 'package:hr_app_flutter/features/news/data/rest_clients/event_entity_api_client.dart';
// import 'package:hr_app_flutter/features/services/data/rest_clients/service_api_client.dart';
// import 'package:hr_app_flutter/features/statements/data/rest_clietns/statement_provider.dart';
// import 'package:hr_app_flutter/features/user/data/rest_clients/user_api_client.dart';
// import 'package:hr_app_flutter/features/wallet/data/rest_clients/wallet_api_client.dart';
// import 'package:hr_app_flutter/features/home/bloc/main_app_screen_view_cubit/main_app_screen_view_cubit.dart';
// import 'package:hr_app_flutter/core/components/database/data_provider/session_data_provider.dart';
// import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
// import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';
// import 'package:hr_app_flutter/features/services/data/repo/lean_production_repository.dart';
// import 'package:hr_app_flutter/features/services/data/repo/service_repository.dart';
// import 'package:hr_app_flutter/features/statements/data/repo/statements_repository.dart';
// import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
// import 'package:hr_app_flutter/features/wallet/data/repo/wallet_repository.dart';

// import 'package:hr_app_flutter/main.dart';
// import 'package:hr_app_flutter/my_app.dart';
// import 'package:hr_app_flutter/router/router.dart';
// import 'package:hr_app_flutter/theme/color_schemes.dart';

// import '../../../auth/bloc/auth_cubit/auth_cubit.dart';
// import '../../../auth/bloc/loader_cubit/loader_view_cubit.dart';
// import '../../../news/bloc/caregory_bloc.dart/category_bloc.dart';
// import '../../../news/bloc/event_entity_bloc/event_entity_bloc.dart';
// import '../../../services/bloc/rookies_bloc/rookies_bloc.dart';
// import '../../../services/bloc/service_bloc/service_bloc.dart';
// import '../../../services/bloc/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';
// import '../../../user/bloc/user_bloc/user_bloc.dart';
// import '../../../wallet/bloc/coins_screen_view_model_bloc/coins_screen_view_model_bloc.dart';
// import '../../../wallet/bloc/wallet_bloc/wallet_bloc.dart';
// import '../../../../core/components/database/flutter_secure_storage/flutter_secure_storage.dart';
// import '../../../../core/components/database/rest_clients/api_client.dart';

// AppFactory makeAppFactory() => const _AppFactoryDefault();

// class _AppFactoryDefault implements AppFactory {
//   final _diContainer = const _DIContainer();

//   const _AppFactoryDefault();

//   @override
//   Widget makeApp() => MyApp(
//         screenFactory: _diContainer._makeScreenFactory(),
//       );
// }

// class _DIContainer {
//   const _DIContainer();

//   static const SecureStorageDefault secureStorageDefault =
//       SecureStorageDefault();

//   static const IHTTPService htttpService = HTTPServiceImpl();

//   ScreenFactoryDefault _makeScreenFactory() => ScreenFactoryDefault(this);

//   SessionDataProvdier _makeSessionDataProvdier() =>
//       const SessionDataProvdierDefault(secureStorage: secureStorageDefault);
//   IAuthProvider _makeAuthProvider() => const AuthProviderImpl(htttpService);
//   IServiceProvider _makeServiceProvider() => ServiceProviderImpl(htttpService);
//   IEventsEntityProvider _makeEventsEntityProvider() =>
//       const EventsEntityProviderImpl(htttpService);
//   IWalletProvider _makeWalletProvider() => WalletProviderImpl(htttpService);
//   IStatementsProvider _makeStatementsProvider() =>
//       StatementProviderImpl(htttpService);
//   IUserProvider _makeUserProvider() => UserProviderImpl(htttpService);
//   IEventEntityRepository _makeEventEntityRepository() =>
//       EventEntityRepositoryImpl(
//           eventEntityProvider: _makeEventsEntityProvider());
//   IWalletRepository _makeWalletRepository() =>
//       WalletRepositoryImpl(walletProvider: _makeWalletProvider());

//   IUserRepository _makeUserRepository() =>
//       UserRepositoryImpl(userProvider: _makeUserProvider());
//   IStatementsRepository _makeStatementsRepository() =>
//       StatementsRepositoryImpl(statementsProvider: _makeStatementsProvider());
//   ILeanProductionRepository _makeLeanProductionRepository() =>
//       LeanProductionRepositoryImpl(serviceProvider: _makeServiceProvider());
//   IServiceRepository _makeServiceRepository() =>
//       ServiceRepositoryImpl(serviceProvider: _makeServiceProvider());
//   IAuthRepository _makeAuthRepository() => AuthRepositoryImpl(
//       authProvider: _makeAuthProvider(),
//       sessionDataProvdier: _makeSessionDataProvdier());
// }

// class ScreenFactoryDefault implements ScreenFactory {
//   final _DIContainer _diContainer;
//   final AppRouter _router = AppRouter();
//   ScreenFactoryDefault(_DIContainer diContainer) : _diContainer = diContainer;

//   @override
//   MultiBlocProvider createMultiBlocProvider() {
//     final IAuthRepository authRepository = _diContainer._makeAuthRepository();
//     final IUserRepository userRepository = _diContainer._makeUserRepository();

//     final IEventEntityRepository eventEntityRepository =
//         _diContainer._makeEventEntityRepository();

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<MainAppScreenViewCubit>(
//           create: (BuildContext context) => MainAppScreenViewCubit(),
//         ),
//         BlocProvider<EventEntityBloc>(
//           create: (BuildContext context) => EventEntityBloc(
//               eventEntityRepository: eventEntityRepository,
//               authRepository: authRepository),
//         ),
//         BlocProvider<WalletBLoC>(
//           create: (BuildContext context) => WalletBLoC(
//               walletRepo: _diContainer._makeWalletRepository(),
//               authRepository: authRepository),
//         ),
//         BlocProvider<UserBloc>(
//           create: (BuildContext context) => UserBloc(
//             userRepo: userRepository,
//             authRepository: authRepository,
//           ),
//         ),
//         BlocProvider<UserBirthDayInfoBLoc>(
//           create: (BuildContext context) => UserBirthDayInfoBLoc(
//               userRepo: userRepository, authRepository: authRepository),
//         ),
//         BlocProvider<RookiesBLoC>(
//           create: (BuildContext context) => RookiesBLoC(
//               userRepo: userRepository, authRepository: authRepository),
//         ),
//         BlocProvider<AuthViewCubit>(
//           create: (BuildContext context) =>
//               AuthViewCubit(authRepository: authRepository),
//         ),
//         BlocProvider<LoaderViewCubit>(
//           create: (BuildContext context) =>
//               LoaderViewCubit(authRepository: authRepository),
//         ),
//         BlocProvider<CoinsScreenViewModelBloc>(
//           create: (BuildContext context) => CoinsScreenViewModelBloc(
//             authRepository: authRepository,
//             walletRepo: _diContainer._makeWalletRepository(),
//           ),
//         ),
//         BlocProvider<CategoryBloc>(
//           create: (BuildContext context) => CategoryBloc(
//             authRepository: authRepository,
//             eventEntityRepository: eventEntityRepository,
//           ),
//         ),
//         BlocProvider<ServiceBloc>(
//           create: (BuildContext context) => ServiceBloc(
//             authRepository: authRepository,
//             serviceRepository: _diContainer._makeServiceRepository(),
//           ),
//         ),
//       ],
//       child: MultiRepositoryProvider(
//         providers: [
//           RepositoryProvider<IStatementsRepository>(
//               create: (context) => _diContainer._makeStatementsRepository()),
//           RepositoryProvider<ILeanProductionRepository>(
//               create: (context) =>
//                   _diContainer._makeLeanProductionRepository()),
//           RepositoryProvider<IAuthRepository>(
//               create: (context) => authRepository),
//           RepositoryProvider<IUserRepository>(
//               create: (context) => userRepository),
//           RepositoryProvider<IEventEntityRepository>(
//               create: (context) => eventEntityRepository),
//         ],
//         child: MaterialApp.router(
//           localizationsDelegates: const [
//             GeneratedLocalization.delegate,
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           supportedLocales: GeneratedLocalization.delegate.supportedLocales,
//           title: 'HR App',
//           theme: lightThemeData,
//           darkTheme: darkThemeData,
//           routerConfig: _router.config(),
//         ),
//       ),
//     );
//   }

//   @override
//   IAuthRepository makeAuthRepo() {
//     return _diContainer._makeAuthRepository();
//   }

//   @override
//   AppRouter makeAppRouter() {
//     return AppRouter();
//   }
// }
