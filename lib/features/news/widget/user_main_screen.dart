import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/localization/localization.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/core/utils/shimmer/shimmer.dart';
import 'package:hr_app_flutter/features/home/widget/components/app_bar/app_bar_user_widget.dart';
import 'package:octopus/octopus.dart';
import '../../services/bloc/rookies_bloc/rookies_bloc.dart';
import '../../services/bloc/service_bloc/service_bloc.dart';
import '../../services/bloc/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';
import '../../services/model/service/service.dart';
import '../../user/bloc/user_bloc/user_bloc.dart';
import '../../wallet/bloc/wallet_bloc/wallet_bloc.dart';
import '../../wallet/model/wallet/wallet.dart';
import '../bloc/caregory_bloc.dart/category_bloc.dart';
import '../bloc/event_entity_bloc/event_entity_bloc.dart';
import '../model/event_entity/new_event_entity.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<ServiceBloc>().add(const ServiceEvent.fetch(isRow: true));
    // context.read<RookiesBLoC>().add(const RookiesEvent.fetch());
    // context.read<WalletBLoC>().add(const WalletEvent.fetch());
    // context
    //     .read<UserBirthDayInfoBLoc>()
    //     .add(const UserBirthDayInfoEvent.fetch());
    // context.read<EventEntityBloc>().add(const EventEntityEvent.fetch());
    // context.read<CategoryBloc>().add(const CategoryEvent.fetch());
  }

  Future<void> _refreshEventsList() async {
    context.read<ServiceBloc>().add(const ServiceEvent.fetch(isRow: true));
    context.read<RookiesBLoC>().add(const RookiesEvent.fetch());

    context
        .read<UserBirthDayInfoBLoc>()
        .add(const UserBirthDayInfoEvent.fetch());
    context.read<EventEntityBloc>().add(const EventEntityEvent.fetch());
    context.read<WalletBLoC>().add(const WalletEvent.fetch());
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
      body: SafeArea(
        child: Shimmer(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: RefreshIndicator(
                color: Theme.of(context).colorScheme.primary,
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
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;
    const double raiudsBorder = 30.0;

    return Container(
      height: (MediaQuery.of(context).size.height / 8) * textScaleFactor,
      margin:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raiudsBorder),
        color: Theme.of(context).colorScheme.primary,
      ),
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
                    Octopus.of(context).push(Routes.leanProductionForm);
                  },
                  child: Text(
                    'Подать заявление',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                  ),
                ),
                MenuItemButton(
                  onPressed: () {
                    Octopus.of(context).push(Routes.myLeanProductions);
                  },
                  child: Text(
                    'Мои заявления',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                  ),
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
    const double raiudsBorder = 30.0;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;
    return Container(
      height: (MediaQuery.of(context).size.height / 8) * textScaleFactor,
      margin:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raiudsBorder),
        color: Theme.of(context).colorScheme.primary,
      ),
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
              Octopus.of(context).push(Routes.searchUser);
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
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;
    const double raiudsBorder = 30.0;

    return Container(
      height: (MediaQuery.of(context).size.height / 8) * textScaleFactor,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raiudsBorder),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: const Row(children: [
        BirthDayInfoElementWidget(
          raiudsBorder: raiudsBorder,
        ),
        VerticalDivider(
          color: Colors.white,
          thickness: 2,
        ),
        RookiesInfoElementWidget(
          raiudsBorder: raiudsBorder,
        ),
      ]),
    );
  }
}

class RookiesInfoElementWidget extends StatelessWidget {
  const RookiesInfoElementWidget({super.key, required this.raiudsBorder});
  final double raiudsBorder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<RookiesBLoC, RookiesState>(
          builder: (BuildContext context, state) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Octopus.of(context).push(Routes.rookieInfo);
            },
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(raiudsBorder),
              bottomRight: Radius.circular(raiudsBorder),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is RookiesState$Processing)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (state is RookiesState$Error) const Text('Ошибка загрузки.'),
                if (state is RookiesState$Successful ||
                    state is RookiesState$Idle)
                  state.data == null
                      ? const Text(
                          'Ничего не найденно',
                        )
                      : Text(
                          state.data!.count.toString(),
                          style: const TextStyle(
                              fontSize: 26, color: Colors.white),
                        ),
                const SizedBox(height: 5),
                const Text(
                  'Новенькие',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class BirthDayInfoElementWidget extends StatelessWidget {
  const BirthDayInfoElementWidget({super.key, required this.raiudsBorder});
  final double raiudsBorder;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<UserBirthDayInfoBLoc, UserBirthDayInfoState>(
        builder: (BuildContext context, state) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(raiudsBorder),
                bottomLeft: Radius.circular(raiudsBorder),
              ),
              onTap: () {
                Octopus.of(context).push(Routes.infoBirthDay);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is UserBirthDayInfoState$Processing)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  if (state is UserBirthDayInfoState$Error)
                    const Text('Ошибка загрузки.'),
                  if (state is UserBirthDayInfoState$Successful ||
                      state is UserBirthDayInfoState$Idle)
                    state.data == null
                        ? const Text(
                            'Ничего не найденно',
                          )
                        : Text(
                            state.data!.count.toString(),
                            style: const TextStyle(
                                fontSize: 26, color: Colors.white),
                          ),
                  const SizedBox(height: 5),
                  const Text(
                    'Дни рождения',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
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
    // final blocWallet = context.watch<WalletBLoC>();
    final double leftPadding = index == 0 ? 16.0 : 8.0;
    final double rightPadding = index == listService.length ? 16.0 : 8.0;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;

    if (index == 0) {
      return BlocBuilder<WalletBLoC, WalletState>(builder: (context, state) {
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
                              Text(
                                '1208',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onInverseSurface),
                              ),
                              Text(
                                Localization.of(context)
                                    .userMainScrenText_index,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                            ],
                          ),
                        ]),
                    const Divider(),
                    switch (state) {
                      WalletState$Idle(:final data) => RowBalanceCountWidget(
                          data: data,
                        ),
                      WalletState$Processing() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      WalletState$Successful(:final data) =>
                        RowBalanceCountWidget(
                          data: data,
                        ),
                      WalletState$Error() =>
                        const Text('Ничего не найденно...'),
                      _ => const Text('Default'),
                    }
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
      });
    } else {
      return Padding(
        padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
        child: groupWidgets[index],
      );
    }
  }
}

class RowBalanceCountWidget extends StatelessWidget {
  const RowBalanceCountWidget({super.key, this.data});
  final Wallet? data;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ColorFiltered(
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary, BlendMode.srcATop),
        child: Image.asset(
          'assets/images/grass_icon_main.png',
          width: 50,
          height: 50,
        ),
      ),
      Column(
        children: [
          Text(
            data != null ? data!.balance.toString() : 'Ничего не найденно...',
            style: TextStyle(
                fontSize: 28,
                color: Theme.of(context).colorScheme.onInverseSurface),
          ),
          Text(
            Localization.of(context).userMainScreenText_balance,
            style: TextStyle(color: Theme.of(context).colorScheme.outline),
          ),
        ],
      ),
    ]);
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
    context.read<EventEntityBloc>().add(const EventEntityEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    // final blocEventEntity = context.watch<EventEntityBloc>();
    final blocCategory = context.watch<CategoryBloc>();

    const double radius = 30.0;

    return BlocBuilder<EventEntityBloc, EventEntityState>(
      builder: (context, state) {
        if (state.data == null) {
          return const Center(child: Text('Ничего не найденно!'));
        }
        if (state is EventEntityState$Processing) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is EventEntityState$Error) {
          return const Center(child: Text('Ошибка загрузки сервисов!'));
        } else {
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
                                      EventEntityEvent.update(
                                          idTab: listCategoryLoaded[index].id,
                                          listEventEntityLoaded: state
                                              .data!.listEventEntityLoaded));

                                  selectedTab = index;
                                });
                              },
                              child: Container(
                                decoration: index == selectedTab
                                    ? BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary, // Цвет подчеркивания
                                              width:
                                                  1.5 // Толщина подчеркивания
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
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .outline),
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
                  itemCount: state.data!.filteredListEventEntity
                      .length, // начинаем с выбранной вкладки
                  itemBuilder: (context, index) {
                    EventEntity item = state
                        .data!.filteredListEventEntity.reversed
                        .toList()[index];
                    // получаем элемент для текущей вкладки
                    return GestureDetector(
                      onTap: () {
                        context.octopus.setState((stateRoute) => stateRoute
                          ..findByName('user-main')
                              ?.add(Routes.profileUser.node(
                            arguments: <String, String>{
                              'id': item.id.toString()
                            },
                          )));
                      },
                      child: CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 100),
                          imageUrl: item.image,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  bottom: 16, right: 16.0),
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
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        item.title,
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.black),
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
        }
      },
    );
  }
}
