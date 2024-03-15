import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/home/widget/components/app_bar/app_bar_user_widget.dart';
import 'package:hr_app_flutter/features/home/widget/components/service_element_to_route/service_element_to_route.dart';
import 'package:hr_app_flutter/features/news/widget/scroll_news_wdiget.dart';
import 'package:hr_app_flutter/features/services/widget/service_element/service_element_widget.dart';
import 'package:octopus/octopus.dart';
import '../../services/bloc/rookies_bloc/rookies_bloc.dart';
import '../../services/bloc/service_bloc/service_bloc.dart';
import '../../services/bloc/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';
import '../../services/model/service/service.dart';
import '../../user/bloc/user_bloc/user_bloc.dart';
import '../../wallet/bloc/wallet_bloc/wallet_bloc.dart';
import '../../news/bloc/caregory_bloc.dart/category_bloc.dart';
import '../../news/bloc/event_entity_bloc/event_entity_bloc.dart';

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
    context.read<UserBloc>().add(const UserEvent
        .fetch()); //  Только обновить т.к сам блок инициализируется в АппБаре
    return Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Сервисы',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Смотреть все',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 7.0,
                          child: const CustomScrollView(
                            scrollDirection: Axis.horizontal,
                            slivers: <Widget>[
                              ScrollBarServiceWidget(),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'События компании',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              TextButton(
                                onPressed: () {
                                  Octopus.of(context).push(Routes.allNews);
                                },
                                child: Text(
                                  'Смотреть все',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ],
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
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 25.0,
                          ),
                          child: ElementServiceToRouteWidget(
                            route: Routes.leanProductionForm,
                            titleService: 'Предложить идею',
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 25.0,
                          ),
                          child: ElementServiceToRouteWidget(
                            route: Routes.searchUser,
                            titleService: 'Найти сотрудника',
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 25.0,
                          ),
                          child: ElementServiceToRouteWidget(
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
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(0, 0),
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
                  Octopus.of(context).push(Routes.infoBirthDay);
                },
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Дни рожения',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 11),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/party_popper.png',
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
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(0, 0),
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
                  Octopus.of(context).push(Routes.rookieInfo);
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
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
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
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(0, 0),
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
// TODO: переход на экран баланса
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
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/grass_coin_3d.png',
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
  const ScrollBarServiceWidget({super.key});

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
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceBloc, ServiceState>(
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
                child: Center(child: Text('Ошибка загрузки сервисов.')));
          } else {
            if (state.data == null) {
              return const SliverToBoxAdapter(
                child: Center(
                    child: Text('Ошибка загрузки сервисов. Сервисы пустые.')),
              );
            } else {
              groupWidgets.clear();

              for (var service in state.data!) {
                if (service.id == 22) {
                  if (service.permissions.createService) {
                    groupWidgets.add(
                      ServiceElementWidget(
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
                      imagePath: 'assets/images/statements.png',
                      title: service.name,
                      isRow: isRow,
                      service: service,
                    ),
                  );
                } else if (service.id == 25) {
                  groupWidgets.add(
                    ServiceElementWidget(
                      imagePath: 'assets/images/airplane.png',
                      title: service.name,
                      isRow: isRow,
                      service: service,
                    ),
                  );
                }
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ElementServiceForScrollBarWidget(
                    listService: state.data!,
                    index: index,
                    groupWidgets: groupWidgets,
                  );
                }, childCount: groupWidgets.length),
              );
            }
          }
        });
  }
}

class ElementServiceForScrollBarWidget extends StatelessWidget {
  const ElementServiceForScrollBarWidget({
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
    final double leftPadding = index == 0 ? 25.0 : 8.0;
    final double rightPadding = index == listService.length ? 25.0 : 8.0;

    return Padding(
      padding: EdgeInsets.only(
          left: leftPadding, right: rightPadding, top: 10, bottom: 10),
      child: groupWidgets[index],
    );
  }
}



// class TableScrollWidget extends StatefulWidget {
//   const TableScrollWidget({super.key});

//   @override
//   State<TableScrollWidget> createState() => _TableScrollWidgetState();
// }

// class _TableScrollWidgetState extends State<TableScrollWidget> {
//   int selectedTab = 0;
//   String selectTabTags = '';
//   late final CategoryBloc blocCategory;
//   @override
//   void initState() {
//     super.initState();
//     blocCategory = context.read<CategoryBloc>();
//     context.read<CategoryBloc>().add(const CategoryEvent.fetch());
//     context.read<EventEntityBloc>().add(const EventEntityEvent.fetch());
//   }

//   @override
//   Widget build(BuildContext context) {
//     const double radius = 30.0;

//     return BlocBuilder<EventEntityBloc, EventEntityState>(
//       builder: (context, state) {
//         if (state.data == null) {
//           return const Center(child: Text('Ничего не найденно!'));
//         }
//         if (state is EventEntityState$Processing) {
//           return const Center(
//             child: CircularProgressIndicator.adaptive(),
//           );
//         } else if (state is EventEntityState$Error) {
//           return const Center(child: Text('Ошибка загрузки сервисов!'));
//         } else {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               BlocBuilder<CategoryBloc, CategoryState>(
//                   bloc: blocCategory,
//                   builder: (context, stateCategory) {
//                     return stateCategory.when(
//                         loading: () {
//                           return const Center(
//                             child: CircularProgressIndicator.adaptive(),
//                           );
//                         },
//                         loaded: (listCategoryLoaded) {
//                           return SizedBox(
//                             height: 50,
//                             child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: listCategoryLoaded.length,
//                               itemBuilder: (context, index) {
//                                 String tab = listCategoryLoaded[index].name;

//                                 return Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(horizontal: 8),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         context.read<EventEntityBloc>().add(
//                                             EventEntityEvent.update(
//                                                 idTab: listCategoryLoaded[index]
//                                                     .id,
//                                                 listEventEntityLoaded: state
//                                                     .data!
//                                                     .listEventEntityLoaded));

//                                         selectedTab = index;
//                                       });
//                                     },
//                                     child: Container(
//                                       decoration: index == selectedTab
//                                           ? BoxDecoration(
//                                               border: Border(
//                                                 bottom: BorderSide(
//                                                     color: Theme.of(context)
//                                                         .colorScheme
//                                                         .primary, // Цвет подчеркивания
//                                                     width:
//                                                         1.5 // Толщина подчеркивания
//                                                     ),
//                                               ),
//                                             )
//                                           : null,
//                                       child: Align(
//                                         alignment: Alignment.bottomCenter,
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(
//                                               bottom: 6.0),
//                                           child: Text(
//                                             tab,
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: index == selectedTab
//                                                     ? Theme.of(context)
//                                                         .colorScheme
//                                                         .primary
//                                                     : Theme.of(context)
//                                                         .colorScheme
//                                                         .outline),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         error: () => const Center(
//                             child: Text('Ошибка загрузки сервисов!')));
//                   }),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 2.7,
//                 child: ListView.builder(
//                   itemExtent: MediaQuery.of(context).size.width / 1.5,
//                   scrollDirection: Axis.horizontal,
//                   padding: const EdgeInsets.all(16),
//                   itemCount: state.data!.filteredListEventEntity
//                       .length, // начинаем с выбранной вкладки
//                   itemBuilder: (context, index) {
//                     EventEntity item = state
//                         .data!.filteredListEventEntity.reversed
//                         .toList()[index];
//                     // получаем элемент для текущей вкладки
//                     return GestureDetector(
//                       onTap: () {
//                         context.octopus.setState((stateRoute) => stateRoute
//                           ..add(Routes.aboutNews.node(
//                             arguments: <String, String>{
//                               'id': item.id.toString()
//                             },
//                           )));
//                       },
//                       child: CachedNetworkImage(
//                           fadeInDuration: const Duration(milliseconds: 100),
//                           imageUrl: item.image,
//                           imageBuilder: (context, imageProvider) {
//                             return Container(
//                               margin: const EdgeInsets.only(
//                                   bottom: 16, right: 16.0),
//                               padding: const EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: imageProvider, fit: BoxFit.cover),
//                                 color: Colors.grey,
//                                 borderRadius: BorderRadius.circular(radius),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Spacer(),
//                                   Container(
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius:
//                                           BorderRadius.circular(radius),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         item.title,
//                                         style: const TextStyle(
//                                             fontSize: 16, color: Colors.black),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }
