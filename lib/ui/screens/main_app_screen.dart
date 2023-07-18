import 'package:flutter/material.dart';
import 'package:hr_app_flutter/domain/api_client/event_entity_api_client.dart';
import 'package:hr_app_flutter/ui/components/tab_bar_widget.dart';
import 'package:hr_app_flutter/ui/screens/grass_coin_screen.dart';
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

  // final apiClient = EventEntityApiClient();
  var pages = <Widget>[
    UserMainScreen.create(),
    const GrassCoinScreen(),
    const Center(
      child: Text(
        'Компакния',
      ),
    ),
    const Center(
      child: Text(
        'Обучение',
      ),
    ),
    const Center(
      child: Text(
        'Сервисы',
      ),
    ),
  ];

  void onChangeTab(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Navigator(
        onGenerateRoute: (settings) {
          List<Widget> screen = pages;
          // if (settings.name == 'page2') screen = page2;
          // if (settings.name == 'page3') screen = page3;
          return MaterialPageRoute(builder: (_) => screen[selectedPageIndex]);
        },
      ),
      // pages[selectedPageIndex],
      bottomNavigationBar: TabBarWidget(
          index: selectedPageIndex, onChangeTab: (index) => onChangeTab(index)),
    );
  }
}
