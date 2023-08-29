import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/main_app_screen_view_cubit.dart';

import 'package:hr_app_flutter/ui/components/tab_bar_widget.dart';
import 'package:hr_app_flutter/ui/screens/grass_coin_screen.dart';
import 'package:hr_app_flutter/ui/screens/services_screen.dart';

import 'package:hr_app_flutter/ui/screens/user_main_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  var selectedPageIndex = 0;
  // bool _modalOpened = false;
  var pages = <Widget>[
    UserMainScreen(),
    GrassCoinScreen(),
    const Center(
      child: Text(
        'Компания',
      ),
    ),
    const Center(
      child: Text(
        'Обучение',
      ),
    ),
    ServicesScreen(),
  ];

  void onChangeTab(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final model = context.watch<MainAppScreenViewCubit>();
    return BlocListener<MainAppScreenViewCubit, MainAppScreenViewState>(
      listener: (context, state) => MainAppScreenViewCubit(),
      child: BlocBuilder<MainAppScreenViewCubit, MainAppScreenViewState>(
          builder: (context, state) {
        return Scaffold(
          appBar: null,
          body: Navigator(
            onGenerateRoute: (settings) {
              List<Widget> screen = pages;
              // if (settings.name == 'page2') screen = page2;
              // if (settings.name == 'page3') screen = page3;
              return MaterialPageRoute(
                  builder: (_) => screen[selectedPageIndex]);
            },
          ),
          // pages[selectedPageIndex],
          bottomNavigationBar: state.modalOpened
              ? null
              : TabBarWidget(
                  index: selectedPageIndex,
                  onChangeTab: (index) => onChangeTab(index)),
        );
      }),
    );
  }
}
