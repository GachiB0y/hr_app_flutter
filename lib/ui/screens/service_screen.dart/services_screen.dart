import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hr_app_flutter/domain/blocs/service_bloc/service_bloc.dart';

import 'package:hr_app_flutter/router/router.dart';

import 'package:hr_app_flutter/theme/colors_from_theme.dart';

@RoutePage()
class ServicesScreen extends StatefulWidget {
  const ServicesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ServiceBloc>().add(const ServiceEvent.fetch(isRow: false));
  }

  // Создание списка групп
  List<Widget> groupWidgets = [];

  @override
  Widget build(BuildContext context) {
    final blocServiceBloc = context.read<ServiceBloc>();
    const double raiudsBorder = 30;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          color: ColorsForWidget.colorGreen,
          onRefresh: () {
            blocServiceBloc.add(const ServiceEvent.fetch(isRow: false));
            return Future<void>.delayed(const Duration(seconds: 1));
          },
          child: CustomScrollView(
            slivers: <Widget>[
              blocServiceBloc.state.when(
                loading: () {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                },
                loaded: (loadedService, loeadedServiceWidgets) {
                  groupWidgets.clear();

                  for (var widget in loeadedServiceWidgets) {
                    groupWidgets.add(widget);
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: groupWidgets,
                    ),
                  );
                },
                error: () =>
                    const SliverToBoxAdapter(child: Text('Nothing found...')),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(raiudsBorder),
                      color: ColorsForWidget.colorGreen),
                  child: TextButton(
                      onPressed: () {
                        context.pushRoute(BagReportRoute(
                            authRepository: blocServiceBloc.authRepository,
                            serviceRepository:
                                blocServiceBloc.serviceRepository));
                      },
                      child: const Text(
                        'Сообщить об ошибке',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
