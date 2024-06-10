import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/home/widget/components/service_element_to_route/service_element_to_route.dart';
import 'package:hr_app_flutter/features/home/widget/user_main_screen.dart';
import 'package:hr_app_flutter/features/services/bloc/service_bloc/service_bloc.dart';

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
    blocServiceBloc = context.read<ServiceBloc>()
      ..add(const ServiceEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'Все сервисы',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: Theme.of(context).colorScheme.primary,
          onRefresh: () {
            blocServiceBloc.add(const ServiceEvent.fetch());
            return Future<void>.delayed(const Duration(seconds: 1));
          },
          child: SingleChildScrollView(
            child: BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
              //  Формируем списки действий с сервисом Новости
              final List<String> titleService = ['Просмотр новостей'];
              final List<Routes> routes = [Routes.allNews];

              if (state.data != null &&
                  state.data!.first.id == 22 &&
                  state.data!.first.permissions.createService == true) {
                // Если можно создаввать новость, то даем такую возможность
                titleService.add('Предложить новость');
                routes.add(Routes.createNews);
              }
              if (state.data != null &&
                  state.data!.first.id == 22 &&
                  state.data!.first.permissions.approveService == true) {
                // Если можно модерировать новость, то даем такую возможность
                titleService.add('Модерация новостей');
                routes.add(Routes.approveNews);
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text(
                      'Популярные',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
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
                  if (state is ServiceState$Processing)
                    const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  else if (state is ServiceState$Error)
                    const Text('Ошибка загрузки')
                  else if (state is ServiceState$Idle ||
                      state is ServiceState$Successful)
                    if (state.data != null)
                      if (state.data!.first.id == 22 &&
                          state.data!.first.permissions.createService == true)
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25.0,
                          ),
                          child: CustomServiceBlockWidget(
                            titleBlockService: 'Новости',
                            titleService: titleService,
                            routes: routes,
                          ),
                        ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 25.0,
                    ),
                    child: CustomServiceBlockWidget(
                      titleBlockService: 'Бережливое',
                      titleService: ['Предложить идею'],
                      routes: [Routes.createLeanProductionScreen],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 25.0,
                    ),
                    child: CustomServiceBlockWidget(
                      titleBlockService: 'Транспорт',
                      titleService: ['Маршруты автобусов'],
                      routes: [Routes.scheduleBus],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 25.0,
                    ),
                    child: CustomServiceBlockWidget(
                      titleBlockService: 'Поддержка',
                      titleService: ['Сообщить об ошибке'],
                      routes: [Routes.bagReport],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class CustomServiceBlockWidget extends StatelessWidget {
  const CustomServiceBlockWidget(
      {super.key,
      required this.titleService,
      required this.titleBlockService,
      required this.routes});
  final String titleBlockService;
  final List<Routes> routes;
  final List<String> titleService;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleBlockService,
          style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: titleService.length,
          itemBuilder: (context, index) {
            return ElementServiceToRouteWidget(
              route: routes[index],
              titleService: titleService[index],
            );
          },
        ),
      ],
    );
  }
}
