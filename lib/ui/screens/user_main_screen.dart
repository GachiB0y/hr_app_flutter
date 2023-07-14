import 'package:flutter/material.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/theme/style_text.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../../theme/colors_from_theme.dart';

class UserMainScreen extends StatelessWidget {
  const UserMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _AppBarFirstScreen(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 4.6,
                  child: ScrollBarWidget()),
              SizedBox(
                height: MediaQuery.of(context).size.height / 26,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'События компании',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 8),
                      child: TableScrollWidget())),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarFirstScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const _AppBarFirstScreen();

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      leadingWidth: 85,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: 20.0,
          ),
          child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: const Color.fromARGB(70, 255, 255, 255),
              borderRadius: BorderRadius.circular(17),
            ),
            child: MaterialButton(
              onPressed: () {},
              textColor: Colors.black,
              padding: const EdgeInsets.all(2),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.notifications_none,
                size: 35,
              ),
            ),
          ),
        ),
      ],
      leading: const Avatar(),
      title: const Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Александр Волков', style: StyleTextCustom.textNameUser),
              SizedBox(
                height: 5,
              ),
              Text('Менеджер по работе с клиентами',
                  style: StyleTextCustom.textJobUserGrey),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Stack(
        children: [
          Container(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 128, 124, 124),
                    border: Border.all(
                      width: 1,
                      color: Color.fromARGB(255, 128, 124, 124),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/man.png',
                    color: Color.fromARGB(255, 0, 0, 0),
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                  padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                  decoration: BoxDecoration(
                    color: ColorsForWidget.colorRed,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '123',
                    style: StyleTextCustom.styleTextNotification,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollBarWidget extends StatelessWidget {
  const ScrollBarWidget({super.key});

  final List<String> text = const [
    '',
    'Справки\nи заявления',
    'Бережливое\nпроизводство',
    'График\nотпусков',
    'Командировки',
    'Расписание\nавтобусов',
    'Режим работы',
    'Структура\nорганизаций',
    'Интерактивная\nкарта помещений',
  ];

  final List<String> pathImages = const [
    '',
    'assets/images/note.png',
    'assets/images/thumbs_up.png',
    'assets/images/airplane.png',
    'assets/images/globe.png',
    'assets/images/bus.png',
    'assets/images/alarm.png',
    'assets/images/tree_structure.png',
    'assets/images/map.png',
  ];

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: text.length,
      itemBuilder: (BuildContext context, int index) {
        final double leftPadding = index == 0 ? 16.0 : 4.0;
        final double rightPadding = index == text.length - 1 ? 16.0 : 4.0;
        return ElementForScrollBarWidget(
          leftPadding: leftPadding,
          rightPadding: rightPadding,
          sizeScreen: sizeScreen,
          text: text,
          index: index,
          pathImages: pathImages,
        );
      },
    );
  }
}

class ElementForScrollBarWidget extends StatelessWidget {
  const ElementForScrollBarWidget({
    super.key,
    required this.leftPadding,
    required this.rightPadding,
    required this.sizeScreen,
    required this.text,
    required this.index,
    required this.pathImages,
  });

  final double leftPadding;
  final int index;
  final double rightPadding;
  final Size sizeScreen;
  final List<String> text;
  final List<String> pathImages;

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return Padding(
        padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          width: sizeScreen.width / 2.2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/icon_crown.png',
                        width: 50,
                        height: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            '1208',
                            style: TextStyle(fontSize: 28),
                          ),
                          Text(
                            S.of(context).userMainScrenText_index,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ]),
                const Divider(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(Colors.orange, BlendMode.srcATop),
                        child: Image.asset(
                          'assets/images/grass_icon_main.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '256',
                            style: TextStyle(fontSize: 28),
                          ),
                          Text(
                            S.of(context).userMainScreenText_balance,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ]),
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorsForWidget.colorGreen),
              width: sizeScreen.width / 2.5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      text[index],
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(pathImages[index])),
            ),
          ],
        ),
      );
    }
  }
}

class TableScrollWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TableScrollWidgetState();
}

class _TableScrollWidgetState extends State<TableScrollWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Widget> _tabs = [
    Text(
      'Актуальное',
      style: TextStyle(
        fontSize: 18,
      ),
    ),
    Text('Новости',
        style: TextStyle(
          fontSize: 18,
        )),
    Text('Сотрудники',
        style: TextStyle(
          fontSize: 18,
        )),
    Text('Мероприятия',
        style: TextStyle(
          fontSize: 18,
        )),
  ];

  List<List<Color>> _tabColors = [
    [
      Colors.red,
      Colors.redAccent,
      Colors.deepOrange,
      Colors.deepOrange,
      Colors.deepOrange,
      Colors.deepOrange,
      Colors.deepOrange,
      Colors.deepOrange,
      Colors.deepOrange,
      Colors.deepOrange
    ],
    [
      Colors.green,
      Colors.greenAccent,
      Colors.teal,
      Colors.teal,
      Colors.teal,
      Colors.teal,
      Colors.teal,
      Colors.teal,
      Colors.teal,
      Colors.teal
    ],
    [
      Colors.blue,
      Colors.blueAccent,
      Colors.indigo,
      Colors.indigo,
      Colors.indigo,
      Colors.indigo,
      Colors.indigo,
      Colors.indigo,
      Colors.indigo,
      Colors.indigo
    ],
    [
      Colors.yellow,
      Colors.yellowAccent,
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.amber
    ],
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: _tabs,
          isScrollable: true,
          indicatorColor: Colors.grey,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey[500],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _tabs.map((tab) {
              int index = _tabs.indexOf(tab);
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _tabColors[index][i],
                    ),
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 20.0, bottom: 8.0),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
