import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/services/widget/service_element/service_element_widget.dart';
import 'package:octopus/octopus.dart';

import '../../bloc/service_bloc/service_bloc.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  late final ServiceBloc blocServiceBloc;
  final bool isRowWidget = false;

  @override
  void initState() {
    super.initState();
    blocServiceBloc = context.read<ServiceBloc>();
    blocServiceBloc.add(const ServiceEvent.fetch());
  }

  // Создание списка групп
  List<Widget> groupWidgets = [];

  @override
  Widget build(BuildContext context) {
    const double raiudsBorder = 30;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: Theme.of(context).colorScheme.primary,
          onRefresh: () {
            blocServiceBloc.add(const ServiceEvent.fetch());
            return Future<void>.delayed(const Duration(seconds: 1));
          },
          child: BlocBuilder<ServiceBloc, ServiceState>(
              bloc: blocServiceBloc,
              builder: (context, state) {
                if (state is ServiceState$Processing) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is ServiceState$Error) {
                  return const Center(
                    child: Text('Nothing found...'),
                  );
                } else {
                  if (state.data == null) {
                    return const Center(
                      child: Text('Сервисы пустые или равны null'),
                    );
                  } else {
                    groupWidgets.clear();
                    for (var service in state.data!) {
                      if (service.id == 22) {
                        if (service.permissions.createService) {
                          groupWidgets.add(
                            ServiceElementWidget(
                              imagePath: 'assets/images/thumbs_up.png',
                              idHandler: 1,
                              title: 'Создать новость',
                              isRow: isRowWidget,
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
                              isRow: isRowWidget,
                              service: service,
                            ),
                          );
                        }
                      } else if (service.id == 24) {
                        groupWidgets.add(
                          ServiceElementWidget(
                            imagePath: 'assets/images/note.png',
                            title: service.name,
                            isRow: isRowWidget,
                            service: service,
                          ),
                        );
                      } else if (service.id == 25) {
                        groupWidgets.add(
                          ServiceElementWidget(
                            imagePath: 'assets/images/bus.png',
                            title: service.name,
                            isRow: isRowWidget,
                            service: service,
                          ),
                        );
                      }
                    }
                    return CustomScrollView(
                      slivers: <Widget>[
                        SliverPadding(
                          padding: const EdgeInsets.all(20),
                          sliver: SliverGrid.count(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: groupWidgets,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(raiudsBorder),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Octopus.of(context).push(Routes.bagReport);
                                },
                                child: const Text(
                                  'Сообщить об ошибке',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                )),
                          ),
                        )
                      ],
                    );
                  }
                }

                // return CustomScrollView(
                //   slivers: <Widget>[
                //     state.when(
                //       loading: () {
                //         return const SliverToBoxAdapter(
                //           child: Center(
                //             child: CircularProgressIndicator.adaptive(),
                //           ),
                //         );
                //       },
                //       loaded: (loadedService, loeadedServiceWidgets) {
                //         groupWidgets.clear();

                //         for (var widget in loeadedServiceWidgets) {
                //           groupWidgets.add(widget);
                //         }
                //         return SliverPadding(
                //           padding: const EdgeInsets.all(20),
                //           sliver: SliverGrid.count(
                //             crossAxisSpacing: 10,
                //             mainAxisSpacing: 10,
                //             crossAxisCount: 2,
                //             children: groupWidgets,
                //           ),
                //         );
                //       },
                //       error: () => const SliverToBoxAdapter(
                //           child: Text('Nothing found...')),
                //     ),
                //     SliverToBoxAdapter(
                //       child: Container(
                //         margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(raiudsBorder),
                //           color: Theme.of(context).colorScheme.primary,
                //         ),
                //         child: TextButton(
                //             onPressed: () {
                //               Octopus.of(context).push(Routes.bagReport);
                //             },
                //             child: const Text(
                //               'Сообщить об ошибке',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.w800),
                //             )),
                //       ),
                //     )
                //   ],
                // );
              }),
        ),
      ),
    );
  }
}
