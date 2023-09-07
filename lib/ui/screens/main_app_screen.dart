import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/constants.dart';
import 'package:hr_app_flutter/domain/blocs/main_app_screen_view_cubit/main_app_screen_view_cubit.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';
import 'package:hr_app_flutter/ui/screens/company_screen.dart';
import 'package:hr_app_flutter/ui/screens/education_screen.dart';
import 'package:hr_app_flutter/ui/screens/grass_coin_screen.dart';
import 'package:hr_app_flutter/ui/screens/services_screen.dart';
import 'package:hr_app_flutter/ui/screens/user_main_screen.dart';

@RoutePage()
class MainAppScreen extends StatefulWidget {
  const MainAppScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  var selectedPageIndex = 0;

  var pages = <Widget>[
    const UserMainScreen(),
    const GrassCoinScreen(),
    const CompanyScreen(),
    const EducationScreen(),
    const ServicesScreen(),
  ];

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainAppScreenViewCubit, MainAppScreenViewState>(
      listener: (context, state) => MainAppScreenViewCubit(),
      child: BlocBuilder<MainAppScreenViewCubit, MainAppScreenViewState>(
          builder: (context, state) {
        return AutoTabsRouter(
          routes: const [
            UserMainRoute(),
            GrassCoinRoute(),
            CompanyRoute(),
            EducationRoute(),
            ServicesRoute(),
          ],
          builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            return Scaffold(
              appBar: null,
              body: child,
              bottomNavigationBar: state.modalOpened
                  ? null
                  : BottomNavigationBar(
                      selectedItemColor: ColorsForWidget.colorGreen,
                      unselectedItemColor: Colors.black,
                      currentIndex: tabsRouter.activeIndex,
                      onTap: (index) => _openPage(index, tabsRouter),
                      items: [
                        BottomNavigationBarItem(
                            icon: const Icon(MyCustomIcon.iconHome, size: 28),
                            label: S.of(context).tabBarText_main),
                        BottomNavigationBarItem(
                            icon: const Icon(MyCustomIcon.iconRub, size: 30),
                            label: S.of(context).tabBarText_grassCoin),
                        BottomNavigationBarItem(
                            icon: const Icon(MyCustomIcon.iconLogoGrass,
                                size: 36),
                            label: S.of(context).tabBarText_company),
                        BottomNavigationBarItem(
                            icon: const Icon(MyCustomIcon.iconBook, size: 30),
                            label: S.of(context).tabBarText_education),
                        BottomNavigationBarItem(
                            icon: const Icon(
                              MyCustomIcon.iconService,
                            ),
                            label: S.of(context).tabBarText_service),
                      ],
                    ),
            );
          },
        );
      }),
    );
  }
}
