import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/home/widget/components/app_bar/app_bar_user_widget.dart';
import 'package:hr_app_flutter/features/home/widget/components/service_element_to_route/service_element_to_route.dart';
import 'package:hr_app_flutter/features/home/widget/home_scope.dart';
import 'package:hr_app_flutter/features/news/bloc/caregory_bloc.dart/category_bloc.dart';
import 'package:hr_app_flutter/features/news/bloc/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/scroll_news_wdiget.dart';
import 'package:hr_app_flutter/features/services/bloc/rookies_bloc/rookies_bloc.dart';
import 'package:hr_app_flutter/features/services/bloc/service_bloc/service_bloc.dart';
import 'package:hr_app_flutter/features/services/bloc/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';
import 'package:hr_app_flutter/features/services/model/service/service.dart';
import 'package:hr_app_flutter/features/services/widget/service_element/service_element_widget.dart';
import 'package:hr_app_flutter/features/user/bloc/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/features/wallet/bloc/wallet_bloc/wallet_bloc.dart';
import 'package:octopus/octopus.dart';

class UserMainBucket extends StatelessWidget {
  const UserMainBucket({super.key});

  @override
  Widget build(BuildContext context) => BucketNavigator(
        bucket: '${Routes.userMain.name}-tab',
      );
}

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RookiesBLoC>().add(const RookiesEvent.fetch());
    context
        .read<UserBirthDayInfoBLoc>()
        .add(const UserBirthDayInfoEvent.fetch());
  }

  Future<void> _refreshEventsList() async {
    context.read<ServiceBloc>().add(const ServiceEvent.fetch());
    context.read<RookiesBLoC>().add(const RookiesEvent.fetch());

    context
        .read<UserBirthDayInfoBLoc>()
        .add(const UserBirthDayInfoEvent.fetch());
    context.read<EventEntityBloc>().add(const EventEntityEvent.fetch());
    context.read<WalletBLoC>().add(const WalletEvent.fetch());
    context.read<CategoryBloc>().add(const CategoryEvent.fetch());
    context.read<UserBloc>().add(
          const UserEvent.fetch(),
        ); //  Только обновить т.к сам блок инициализируется в АппБаре
    return Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: RefreshIndicator(
              color: Theme.of(context).colorScheme.primary,
              backgroundColor: Colors.white,
              onRefresh: _refreshEventsList,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: AppBarUserWdiget(),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: RowElementTitleAndSeeAllBottonWidget(
                              title: 'Сервисы',
                              onTap: () =>
                                  HomeScope.of(context).state.onItemTapped(4),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 7.0,
                            child: CustomScrollView(
                              scrollDirection: Axis.horizontal,
                              slivers: <Widget>[
                                ScrollBarServiceWidget(
                                  tabName: '${Routes.services.name}-tab',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: RowElementTitleAndSeeAllBottonWidget(
                              title: 'События компании',
                              onTap: () {
                                context.octopus.setState(
                                  (state) => state
                                    ..findByName('user-main-tab')?.add(
                                      Routes.allNews.node(),
                                    ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 5.26,
                            child: const CustomScrollView(
                              scrollDirection: Axis.horizontal,
                              slivers: [
                                ScrollNewsWidget(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 25.0, right: 25),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: BirthDayInfoRectangleWidget()),
                                SizedBox(width: 7),
                                Expanded(child: RookiesInfoRectangleWidget()),
                                SizedBox(width: 7),
                                Expanded(child: BalanceInfoRectangleWidget()),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25.0,
                            ),
                            child: ElementServiceToRouteWidget(
                              nameParent: '${Routes.userMain.name}-tab',
                              route: Routes.writeProblemLeanProductionScreen,
                              titleService: 'Предложить идею',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25.0,
                            ),
                            child: ElementServiceToRouteWidget(
                              nameParent: '${Routes.userMain.name}-tab',
                              route: Routes.searchUser,
                              titleService: 'Найти сотрудника',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25.0,
                            ),
                            child: ElementServiceToRouteWidget(
                              nameParent: '${Routes.userMain.name}-tab',
                              route: Routes.scheduleBus,
                              titleService: 'Узнать маршруты автобуса',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class RowElementTitleAndSeeAllBottonWidget extends StatelessWidget {
  const RowElementTitleAndSeeAllBottonWidget({
    required this.title,
    super.key,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(4.0),
              onTap: onTap,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Смотреть все',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 15,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}

class BirthDayInfoRectangleWidget extends StatelessWidget {
  const BirthDayInfoRectangleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const radius = 18.0;
    return BlocBuilder<UserBirthDayInfoBLoc, UserBirthDayInfoState>(
      builder: (context, state) {
        if (state is UserBirthDayInfoState$Processing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserBirthDayInfoState$Error) {
          return const Text('Ошибка загрузки.');
        } else {
          return Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                ),
              ],
              borderRadius: BorderRadius.circular(radius),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(radius),
                ),
                onTap: () {
                  context.octopus.setState(
                    (state) => state
                      ..findByName('user-main-tab')?.add(
                        Routes.infoBirthDay.node(),
                      ),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      'Дни рождения',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 11),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/party_popper.png',
                          width: 26,
                          height: 26,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          state.data == null
                              ? '0'
                              : state.data!.count.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 23),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class RookiesInfoRectangleWidget extends StatelessWidget {
  const RookiesInfoRectangleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const radius = 18.0;
    return BlocBuilder<RookiesBLoC, RookiesState>(
      builder: (context, state) {
        if (state is UserBirthDayInfoState$Processing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserBirthDayInfoState$Error) {
          return const Text('Ошибка загрузки.');
        } else {
          return Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                ),
              ],
              borderRadius: BorderRadius.circular(radius),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(radius),
                ),
                onTap: () {
                  context.octopus.setState(
                    (state) => state
                      ..findByName('user-main-tab')?.add(
                        Routes.rookieInfo.node(),
                      ),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      'Новенькие',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 11),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          height: 26,
                          width: 26,
                          'assets/images/rookies.png',
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          state.data == null
                              ? '0'
                              : state.data!.count.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 23),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class BalanceInfoRectangleWidget extends StatelessWidget {
  const BalanceInfoRectangleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const radius = 18.0;
    return BlocBuilder<WalletBLoC, WalletState>(
      builder: (context, state) {
        if (state is UserBirthDayInfoState$Processing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserBirthDayInfoState$Error) {
          return const Text('Ошибка загрузки.');
        } else {
          return Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                ),
              ],
              borderRadius: BorderRadius.circular(radius),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(radius),
                ),
                onTap: () {
                  HomeScope.of(context).state.onItemTapped(1);
                },
                child: Column(
                  children: [
                    Text(
                      'Баланс coin',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 11),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/grass_coin_3d.png',
                          width: 26,
                          height: 26,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          state.data == null
                              ? '0'
                              : state.data!.balance.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 23),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class ScrollBarServiceWidget extends StatefulWidget {
  const ScrollBarServiceWidget({required this.tabName, super.key});
  final String tabName;

  @override
  State<ScrollBarServiceWidget> createState() => _ScrollBarServiceWidgetState();
}

class _ScrollBarServiceWidgetState extends State<ScrollBarServiceWidget> {
  List<Widget> groupWidgets = [];
  late final ServiceBloc blocService;
  final bool isRow = true;
  @override
  void initState() {
    blocService = context.read<ServiceBloc>();
    super.initState();
  }

  @override
  void dispose() {
    blocService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<ServiceBloc, ServiceState>(
        bloc: blocService,
        builder: (context, state) {
          if (state is ServiceState$Processing) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ServiceState$Error) {
            return const SliverToBoxAdapter(
              child: Center(child: Text('Ошибка загрузки сервисов.')),
            );
          } else {
            if (state.data == null) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text('Ошибка загрузки сервисов. Сервисы пустые.'),
                ),
              );
            } else {
              groupWidgets.clear();

              for (final service in state.data!) {
                if (service.id == 22) {
                  if (service.permissions.createService) {
                    groupWidgets.add(
                      ServiceElementWidget(
                        tabName: widget.tabName,
                        imagePath: 'assets/images/create_news.png',
                        idHandler: 1,
                        title: 'Создать новость',
                        isRow: isRow,
                        service: service,
                      ),
                    );
                  }
                  if (service.permissions.approveService) {
                    groupWidgets.add(
                      ServiceElementWidget(
                        tabName: widget.tabName,
                        imagePath: 'assets/images/create_news.png',
                        idHandler: 2,
                        title: 'Модерация новостей',
                        isRow: isRow,
                        service: service,
                      ),
                    );
                  }
                } else if (service.id == 24) {
                  groupWidgets.add(
                    ServiceElementWidget(
                      tabName: widget.tabName,
                      imagePath: 'assets/images/statements.png',
                      title: service.name,
                      isRow: isRow,
                      service: service,
                    ),
                  );
                } else if (service.id == 25) {
                  groupWidgets.add(
                    ServiceElementWidget(
                      tabName: widget.tabName,
                      imagePath: 'assets/images/bus.png',
                      title: service.name,
                      isRow: isRow,
                      service: service,
                    ),
                  );
                }
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) =>
                      ElementServiceForScrollBarWidget(
                    listService: state.data!,
                    index: index,
                    groupWidgets: groupWidgets,
                  ),
                  childCount: groupWidgets.length,
                ),
              );
            }
          }
        },
      );
}

class ElementServiceForScrollBarWidget extends StatelessWidget {
  const ElementServiceForScrollBarWidget({
    required this.listService,
    required this.index,
    required this.groupWidgets,
    super.key,
  });

  final int index;

  final List<Service> listService;
  final List<Widget> groupWidgets;

  @override
  Widget build(BuildContext context) {
    final leftPadding = index == 0 ? 25.0 : 8.0;
    final rightPadding = index == listService.length ? 25.0 : 8.0;

    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: rightPadding,
        top: 10,
        bottom: 10,
      ),
      child: groupWidgets[index],
    );
  }
}
