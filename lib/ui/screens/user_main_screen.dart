import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/caregory_bloc.dart/category_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/rookies_bloc/rookies_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/service_bloc/service_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/new_event_entity.dart';
import 'package:hr_app_flutter/domain/entity/service/service.dart';
import 'package:hr_app_flutter/domain/repository/lean_production_repository.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/ui/components/app_bar/app_bar_user_widget.dart';
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
    context.read<ServiceBloc>().add(const ServiceEvent.fetch(isRow: true));
    context.read<RookiesBloc>().add(const RookiesEvent.fetch());
    context.read<WalletBloc>().add(const WalletEvent.fetch());
    context
        .read<UserBirthDayInfoBloc>()
        .add(const UserBirthDayInfoEvent.fetch());
    context.read<EventEntityBloc>().add(const EventEntityEvent.fetch());
    context.read<CategoryBloc>().add(const CategoryEvent.fetch());
  }

  Future<void> _refreshEventsList() async {
    context.read<ServiceBloc>().add(const ServiceEvent.fetch(isRow: true));
    context.read<RookiesBloc>().add(const RookiesEvent.fetch());

    context
        .read<UserBirthDayInfoBloc>()
        .add(const UserBirthDayInfoEvent.fetch());
    context.read<EventEntityBloc>().add(const EventEntityEvent.fetch());
    context.read<WalletBloc>().add(const WalletEvent.fetch());
    context.read<CategoryBloc>().add(const CategoryEvent.fetch());
    context.read<UserBloc>().add(const UserEvent
        .fetch()); //  Только обновить т.к сам блок инициализируется в АппБаре
    return Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 1.0),
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
                        height: (MediaQuery.of(context).size.height / 4.25) *
                            textScaleFactor,
                        child: const ScrollBarWidget()),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'События компании',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 2.3,
                        child: Container(
                            padding: const EdgeInsets.only(left: 8),
                            child: const TableScrollWidget())),
                    const InfoBirthdayAndNewPeopleWidget(),
                    const LeanProductionButton(),
                    const SerachPeopleButtonWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LeanProductionButton extends StatelessWidget {
  const LeanProductionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final blocUser = context.read<UserBloc>();
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;
    const double raiudsBorder = 30.0;

    return Container(
      height: (MediaQuery.of(context).size.height / 8) * textScaleFactor,
      margin:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raiudsBorder),
          color: ColorsForWidget.colorGreen),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            // Image.asset(
            //   'assets/images/lean_production_img.png',
            //   width: 50,
            //   height: 50,
            // ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Бережливое производство',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'предложить идею',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            MenuAnchor(
              style: const MenuStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
                elevation: MaterialStatePropertyAll(5.0),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(raiudsBorder),
                    ),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xffb3f2b2),
                  // Colors.white
                ),
              ),
              builder: (BuildContext context, MenuController controller,
                  Widget? child) {
                return IconButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: const Icon(
                    Icons.more_vert_outlined,
                    size: 36,
                    color: Colors.white,
                  ),
                  tooltip: 'Показать меню',
                );
              },
              menuChildren: [
                MenuItemButton(
                  onPressed: () {
                    final leanProductionRepository =
                        RepositoryProvider.of<LeanProductionRepository>(
                            context);
                    AutoRouter.of(context).push(LeanProductionFormRoute(
                        authRepository: blocUser.authRepository,
                        userRepo: blocUser.userRepo,
                        leanRepository: leanProductionRepository));
                  },
                  child: const Text('Подать заявление'),
                ),
                MenuItemButton(
                  onPressed: () {
                    final leanProductionRepository =
                        RepositoryProvider.of<LeanProductionRepository>(
                            context);
                    AutoRouter.of(context).push(MyLeanProductionsRoute(
                        authRepository: blocUser.authRepository,
                        userRepo: blocUser.userRepo,
                        leanRepository: leanProductionRepository));
                  },
                  child: const Text('Мои заявления'),
                ),
              ],
            ),
          ]),
        ),
      ]),
    );
  }
}

class SerachPeopleButtonWidget extends StatelessWidget {
  const SerachPeopleButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final blocUser = context.read<UserBloc>();
    const double raiudsBorder = 30.0;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;
    return Container(
      height: (MediaQuery.of(context).size.height / 8) * textScaleFactor,
      margin:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raiudsBorder),
          color: ColorsForWidget.colorGreen),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Найти соотрудника',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'структура компании',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/images/new_people.png',
              width: 75,
              height: 75,
            ),
          ]),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(raiudsBorder),
            onTap: () {
              AutoRouter.of(context).push(SearchUserRoute(
                  authRepository: blocUser.authRepository,
                  userRepo: blocUser.userRepo));
            },
          ),
        ),
      ]),
    );
  }
}

class InfoBirthdayAndNewPeopleWidget extends StatelessWidget {
  const InfoBirthdayAndNewPeopleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserBirthDayInfoBloc blocBirthDayInfo =
        context.watch<UserBirthDayInfoBloc>();
    final RookiesBloc blocRookies = context.watch<RookiesBloc>();
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;
    const double raiudsBorder = 30.0;

    return Container(
      height: (MediaQuery.of(context).size.height / 8) * textScaleFactor,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raiudsBorder),
          color: ColorsForWidget.colorGreen),
      child: Row(children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              blocBirthDayInfo.state.when(
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (birthDayInfo) {
                  return Text(
                    birthDayInfo.count.toString(),
                    style: const TextStyle(fontSize: 26, color: Colors.white),
                  );
                },
                error: () => const Text('Ошибка загрузки.'),
              ),
              const SizedBox(height: 5),
              const Text(
                'Дни рождения',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
        const VerticalDivider(
          color: Colors.white,
          thickness: 2,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              blocRookies.state.when(
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (rookiseInfo) {
                  return Text(
                    rookiseInfo.count.toString(),
                    style: const TextStyle(fontSize: 26, color: Colors.white),
                  );
                },
                error: () => const Text('Ошибка загрузки.'),
              ),
              const SizedBox(height: 5),
              const Text(
                'Новенькие',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class ScrollBarWidget extends StatefulWidget {
  const ScrollBarWidget({super.key});

  @override
  State<ScrollBarWidget> createState() => _ScrollBarWidgetState();
}

class _ScrollBarWidgetState extends State<ScrollBarWidget> {
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
      loaded: (loadedServices, loeadedServiceWidgets) {
        groupWidgets.clear();
        groupWidgets.add(const SizedBox.shrink());

        for (var widget in loeadedServiceWidgets) {
          groupWidgets.add(widget);
        }
        double textScaleFactor = MediaQuery.of(context).textScaleFactor;
        if (textScaleFactor < 1) textScaleFactor = 1;
        return ListView.builder(
          // shrinkWrap: true,
          itemExtent:
              (MediaQuery.of(context).size.height / 4.25) * textScaleFactor,
          scrollDirection: Axis.horizontal,
          itemCount: groupWidgets.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: ElementForScrollBarWidget(
                listService: loadedServices,
                index: index,
                groupWidgets: groupWidgets,
              ),
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
    final double leftPadding = index == 0 ? 16.0 : 8.0;
    final double rightPadding = index == listService.length ? 16.0 : 8.0;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;

    if (index == 0) {
      return Padding(
        padding: EdgeInsets.only(
          left: leftPadding,
          right: rightPadding,
        ),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 6),
            ),
          ], borderRadius: BorderRadius.circular(50), color: Colors.white),
          width: (sizeScreen.width / 2.2) * textScaleFactor,
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

    const double radius = 30.0;

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
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.7,
              child: ListView.builder(
                itemExtent: MediaQuery.of(context).size.width / 1.5,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(16),
                itemCount:
                    filteredEventEntity.length, // начинаем с выбранной вкладки
                itemBuilder: (context, index) {
                  EventEntity item =
                      filteredEventEntity.reversed.toList()[index];
                  // получаем элемент для текущей вкладки
                  return GestureDetector(
                    onTap: () {
                      context.pushRoute(AboutNewsRoute(
                          id: item.id,
                          authRepository: blocEventEntity.authRepository,
                          eventEntityRepository:
                              blocEventEntity.eventEntityRepository));
                    },
                    child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 100),
                        imageUrl: item.image,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            margin:
                                const EdgeInsets.only(bottom: 16, right: 16.0),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(radius),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(radius),
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
                        }),
                  );
                },
              ),
            ),
          ],
        );
      },
      error: () => const Text('Nothing found...'),
    );
  }
}
