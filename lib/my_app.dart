import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/api_client/event_entity_api_client.dart';
import 'package:hr_app_flutter/domain/blocs/event_entity_cubit.dart';
import 'package:hr_app_flutter/domain/blocs/main_app_screen_view_cubit.dart';
import 'package:hr_app_flutter/domain/repository/event_entity_repo.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';
import 'package:hr_app_flutter/ui/screens/grass_coin_screen.dart';
import 'package:hr_app_flutter/ui/screens/main_app_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final EventEntityRepository eventEntityRepository =
      EventEntityRepositoryImpl(eventEntityProvider: EventEntityApiClient());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Flutter Demo',
        theme: ThemeData(
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(backgroundColor: Colors.red[200]),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<MainAppScreenViewCubit>(
              create: (BuildContext context) => MainAppScreenViewCubit(),
            ),
            BlocProvider<EventEntityCubit>(
              create: (BuildContext context) => EventEntityCubit(
                  eventEntityRepository: eventEntityRepository),
            ),
          ],
          child: const MainAppScreen(),
        ));
  }
}
