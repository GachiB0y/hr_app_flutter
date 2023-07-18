import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/api_client/event_entity_api_client.dart';
import 'package:hr_app_flutter/domain/blocs/event_entity_cubit.dart';
import 'package:hr_app_flutter/domain/entity/event_entity.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/theme/style_text.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:hr_app_flutter/ui/components/app_bar_user_widget.dart';

import '../../theme/colors_from_theme.dart';

class UserMainScreen extends StatelessWidget {
  UserMainScreen({super.key});
  // final apiClient = new EventEntityApiClient();

  static Widget create() {
    return BlocProvider<EventEntityCubit>(
      create: (context) =>
          EventEntityCubit(apiClientEventEntity: EventEntityApiClient()),
      child: UserMainScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const AppBarUserWdiget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height / 4.6,
                  child: const ScrollBarWidget()),
              SizedBox(
                height: MediaQuery.of(context).size.height / 26,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'События компании',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: const TableScrollWidget())),
            ],
          ),
        ),
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
          width: sizeScreen.width / 2.4,
          child: Stack(children: [
            Padding(
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
                            const Text(
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
                          colorFilter: const ColorFilter.mode(
                              Colors.orange, BlendMode.srcATop),
                          child: Image.asset(
                            'assets/images/grass_icon_main.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
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
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {},
              ),
            )
          ]),
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
              width: sizeScreen.width / 2.4,
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
            SizedBox(
                width: sizeScreen.width / 2.4,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                  ),
                )),
          ],
        ),
      );
    }
  }
}

// class TableScrollWidget extends StatefulWidget {
//   const TableScrollWidget({super.key});

//   @override
//   State<StatefulWidget> createState() => _TableScrollWidgetState();
// }

// class _TableScrollWidgetState extends State<TableScrollWidget>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   final List<Widget> _tabs = [
//     const Text(
//       'Актуальное',
//       style: TextStyle(
//         fontSize: 18,
//       ),
//     ),
//     const Text('Новости',
//         style: TextStyle(
//           fontSize: 18,
//         )),
//     const Text('Сотрудники',
//         style: TextStyle(
//           fontSize: 18,
//         )),
//     const Text('Мероприятия',
//         style: TextStyle(
//           fontSize: 18,
//         )),
//   ];

//   final List<List<EventEntity>> _events = [];

//   final List<List<Color>> _tabColors = const [
//     [
//       Colors.red,
//       Colors.redAccent,
//       Colors.deepOrange,
//       Colors.deepOrange,
//       Colors.deepOrange,
//       Colors.deepOrange,
//       Colors.deepOrange,
//       Colors.deepOrange,
//       Colors.deepOrange,
//       Colors.deepOrange
//     ],
//     [
//       Colors.green,
//       Colors.greenAccent,
//       Colors.teal,
//       Colors.teal,
//       Colors.teal,
//       Colors.teal,
//       Colors.teal,
//       Colors.teal,
//       Colors.teal,
//       Colors.teal
//     ],
//     [
//       Colors.blue,
//       Colors.blueAccent,
//       Colors.indigo,
//       Colors.indigo,
//       Colors.indigo,
//       Colors.indigo,
//       Colors.indigo,
//       Colors.indigo,
//       Colors.indigo,
//       Colors.indigo
//     ],
//     [
//       Colors.yellow,
//       Colors.yellowAccent,
//       Colors.amber,
//       Colors.amber,
//       Colors.amber,
//       Colors.amber,
//       Colors.amber,
//       Colors.amber,
//       Colors.amber,
//       Colors.amber
//     ],
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: _tabs.length, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TabBar(
//           controller: _tabController,
//           tabs: _tabs,
//           isScrollable: true,
//           indicatorColor: Colors.grey,
//           labelColor: Colors.black,
//           unselectedLabelColor: Colors.grey[500],
//         ),
//         Expanded(
//           child: TabBarView(
//             controller: _tabController,
//             children: _tabs.map((tab) {
//               int index = _tabs.indexOf(tab);
//               return ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10,
//                 itemBuilder: (context, i) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: _tabColors[index][i],
//                     ),
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     margin: const EdgeInsets.only(
//                         left: 8.0, right: 8.0, top: 20.0, bottom: 8.0),
//                   );
//                 },
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

class TableScrollWidget extends StatefulWidget {
  const TableScrollWidget({super.key});

  @override
  State<TableScrollWidget> createState() => _TableScrollWidgetState();
}

class _TableScrollWidgetState extends State<TableScrollWidget> {
  int selectedTab = 0;
  String selectTabTags = '';
  late final List<EventEntity> events;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final cubit = context.read<EventEntityCubit>();
        events = cubit.state.itemsGet;
        selectTabTags = cubit.state.tabs[selectedTab];
        cubit.changeVisibleEvents(index: selectedTab);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<EventEntityCubit>();
    selectTabTags = cubit.state.tabs[selectedTab];

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cubit.state.tabs.length,
            itemBuilder: (context, index) {
              String tab = cubit.state.tabs[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = index;
                      cubit.changeVisibleEvents(index: index);
                    });
                  },
                  child: Container(
                    decoration: index == selectedTab
                        ? const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.black, // Цвет подчеркивания
                                  width: 1.5 // Толщина подчеркивания
                                  ),
                            ),
                          )
                        : null,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          tab,
                          style: TextStyle(
                            fontSize: 18,
                            color: index == selectedTab
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        IconButton(
            onPressed: () {
              cubit.addItem();
            },
            icon: const Icon(Icons.add)),
        cubit.state.eventsActual.isEmpty
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(16),
                  itemCount: cubit.state.eventsActual
                      .length, // начинаем с выбранной вкладки
                  itemBuilder: (context, index) {
                    EventEntity item =
                        cubit.state.eventsActual.reversed.toList()[index];
                    // получаем элемент для текущей вкладки
                    return Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      margin: const EdgeInsets.only(bottom: 16, right: 16.0),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg'),
                            fit: BoxFit.cover),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 8),
                          Text(item.description),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
