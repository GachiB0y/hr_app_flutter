import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/api_client/event_entity_api_client.dart';
import 'package:hr_app_flutter/domain/blocs/event_entity_cubit.dart';
import 'package:hr_app_flutter/domain/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:hr_app_flutter/domain/entity/event_entity.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/ui/components/app_bar/app_bar_user_widget.dart';

import '../../theme/colors_from_theme.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});
  // final apiClient = new EventEntityApiClient();

  // static Widget create() {
  //   return BlocProvider<EventEntityCubit>(
  //     create: (context) =>
  //         EventEntityCubit(apiClientEventEntity: EventEntityApiClient()),
  //     child: UserMainScreen(),
  //   );
  // }

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  @override
  void initState() {
    context.read<EventEntityCubit>().changeVisibleEvents(index: 0);
    super.initState();
  }

  Future<void> _refreshEventsList() async {
    final cubit = context.read<EventEntityCubit>();
    cubit.loadEventsList();
    return Future<void>.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: const AppBarUserWdiget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: RefreshIndicator(
            color: ColorsForWidget.colorGreen,
            backgroundColor: Colors.white,
            onRefresh: _refreshEventsList,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarUserWdiget(),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 4.6,
                      child: const ScrollBarWidget()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'События компании',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 2.3,
                      child: Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: const TableScrollWidget())),
                ],
              ),
            ),
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
    final blocWallet = context.watch<WalletBloc>();
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
                  blocWallet.state.when(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loaded: (walletLoaded) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                                ColorsForWidget.colorGreen, BlendMode.srcATop),
                            child: Image.asset(
                              'assets/images/grass_icon_main.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                walletLoaded.balance.toString(),
                                style: const TextStyle(fontSize: 28),
                              ),
                              Text(
                                S.of(context).userMainScreenText_balance,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ]),
                    error: () => const Text('Nothing found...'),
                  ),
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
    final cubit = context.read<EventEntityCubit>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        events = cubit.state.itemsGet;
        selectTabTags = cubit.state.tabs[selectedTab];
        // cubit.changeVisibleEvents(index: selectedTab);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<EventEntityCubit>();
    selectTabTags = cubit.state.tabs[selectedTab];

    return Column(
      mainAxisSize: MainAxisSize.min,
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
        cubit.state.eventsActual.isEmpty
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.7,
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
                          image: DecorationImage(
                              image: item.base64Image == null
                                  ? NetworkImage(item.imagePath)
                                      as ImageProvider<Object>
                                  : MemoryImage(
                                      base64Decode(item.base64Image!)),
                              fit: BoxFit.cover),
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item.title,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
