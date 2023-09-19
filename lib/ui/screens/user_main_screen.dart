import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/caregory_bloc.dart/category_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/service_bloc/service_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/new_event_entity.dart';
import 'package:hr_app_flutter/domain/entity/service/service.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/ui/components/app_bar/app_bar_user_widget.dart';
import 'package:hr_app_flutter/ui/components/service_element/service_element_widget.dart';

import '../../theme/colors_from_theme.dart';

@RoutePage()
class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ServiceBloc>().add(const ServiceEvent.fetch());
    context.read<WalletBloc>().add(const WalletEvent.fetch());
    context.read<EventEntityBloc>().add(const EventEntityEvent.fetch());
    context.read<CategoryBloc>().add(const CategoryEvent.fetch());
  }

  Future<void> _refreshEventsList() async {
    context.read<ServiceBloc>().add(const ServiceEvent.fetch());
    context.read<EventEntityBloc>().add(const EventEntityEvent.fetch());
    context.read<WalletBloc>().add(const WalletEvent.fetch());
    context.read<CategoryBloc>().add(const CategoryEvent.fetch());
    return Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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

class ScrollBarWidget extends StatefulWidget {
  const ScrollBarWidget({super.key});

  @override
  State<ScrollBarWidget> createState() => _ScrollBarWidgetState();
}

class _ScrollBarWidgetState extends State<ScrollBarWidget> {
  final List<String> pathImages = const [
    '',
    'assets/images/note.png',
    'assets/images/bus.png',
    'assets/images/thumbs_up.png',
    'assets/images/tree_structure.png',
    'assets/images/airplane.png',
    'assets/images/globe.png',
    'assets/images/alarm.png',
    'assets/images/map.png',
  ];
  List<Widget> groupWidgets = [];
  @override
  Widget build(BuildContext context) {
    final blocService = context.watch<ServiceBloc>();

    return blocService.state.when(
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      loaded: (loadedServices) {
        groupWidgets.clear();
        groupWidgets.add(const SizedBox.shrink());
        for (var service in loadedServices) {
          if (service.id == 22) {
            if (service.permissions.createService) {
              groupWidgets.add(
                ServiceElementWidget(
                  imagePath: 'assets/images/thumbs_up.png',
                  idHandler: 1,
                  title: 'Создать новость',
                  isRow: true,
                  service: service,
                ),
              );
            }
            if (service.permissions.approveService) {
              groupWidgets.add(
                ServiceElementWidget(
                  imagePath: 'assets/images/tree_structure.png',
                  idHandler: 2,
                  title: 'Модерация новостей',
                  isRow: true,
                  service: service,
                ),
              );
            }
          } else if (service.id == 24) {
            groupWidgets.add(
              ServiceElementWidget(
                imagePath: 'assets/images/note.png',
                title: service.name,
                isRow: true,
                service: service,
              ),
            );
          } else if (service.id == 25) {
            groupWidgets.add(
              ServiceElementWidget(
                imagePath: 'assets/images/bus.png',
                title: service.name,
                isRow: true,
                service: service,
              ),
            );
          }
        }
        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: groupWidgets.length,
          itemBuilder: (BuildContext context, int index) {
            return ElementForScrollBarWidget(
              listService: loadedServices,
              index: index,
              groupWidgets: groupWidgets,
            );
          },
        );
      },
      error: () => const SafeArea(
          child: Center(child: Text('Ошибка загрузки сервисов.'))),
    );
  }
}

class ElementForScrollBarWidget extends StatelessWidget {
  const ElementForScrollBarWidget({
    super.key,
    required this.listService,
    required this.index,
    required this.groupWidgets,
  });

  final int index;

  final List<Service> listService;
  final List<Widget> groupWidgets;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    final blocWallet = context.watch<WalletBloc>();
    final double leftPadding = index == 0 ? 16.0 : 4.0;
    final double rightPadding = index == listService.length - 1 ? 16.0 : 4.0;
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
        child: groupWidgets[index],
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

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(const CategoryEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    final blocEventEntity = context.watch<EventEntityBloc>();
    final blocCategory = context.watch<CategoryBloc>();

    return blocEventEntity.state.when(
      loading: () {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
      loaded: (listEventEntityLoaded, filteredEventEntity) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            blocCategory.state.when(
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
                loaded: (listCategoryLoaded) {
                  return SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listCategoryLoaded.length,
                      itemBuilder: (context, index) {
                        String tab = listCategoryLoaded[index].name;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                context.read<EventEntityBloc>().add(
                                    EventEntityEvent.filterNews(
                                        idTab: listCategoryLoaded[index].id,
                                        listEventEntityLoaded:
                                            listEventEntityLoaded));

                                selectedTab = index;
                              });
                            },
                            child: Container(
                              decoration: index == selectedTab
                                  ? const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors
                                                .black, // Цвет подчеркивания
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
                  );
                },
                error: () =>
                    const Center(child: Text('Ошибка загрузки сервисов!'))),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.7,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredEventEntity
                      .length, // начинаем с выбранной вкладки
                  itemBuilder: (context, index) {
                    EventEntity item =
                        filteredEventEntity.reversed.toList()[index];
                    // получаем элемент для текущей вкладки
                    return Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      margin: const EdgeInsets.only(bottom: 16, right: 16.0),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.network(item.image).image,

                            // NetworkImage(item.image)
                            //     as ImageProvider<Object>,
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
      },
      error: () => const Text('Nothing found...'),
    );
  }
}
