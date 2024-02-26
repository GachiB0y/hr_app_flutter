import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/schedule_bus/bloc/schedule_bus_bloc.dart';
import 'package:hr_app_flutter/features/schedule_bus/widget/schedule_bus_scope.dart';
import 'package:url_launcher/url_launcher.dart';

class ScheduleBusScreen extends StatelessWidget {
  const ScheduleBusScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ScheduleBusScope(
        child: SafeArea(
      child: NestedScreenWidget(),
    ));
  }
}

class NestedScreenWidget extends StatefulWidget {
  const NestedScreenWidget({
    super.key,
  });

  @override
  State<NestedScreenWidget> createState() => _NestedScreenWidgetState();
}

class _NestedScreenWidgetState extends State<NestedScreenWidget> {
  int index = 0;

  @override
  void didChangeDependencies() {
    index = ScheduleBusScope.of(context).state.index;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: const [
        CititesSelectScreen(),
        _SecondScheduleBusScreen(),
        _ThirdScheduleBusScreen(),
        DestinationListWidget(),
      ],
    );
  }
}

/// {@template schedule_bus_screen}
/// CititesSelectScreen widget.
/// {@endtemplate}
class CititesSelectScreen extends StatelessWidget {
  /// {@macro schedule_bus_screen}
  const CititesSelectScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: AppBarForScheduleBusScreenWidget(),
        body: SafeArea(
          child: Column(
            children: [
              _BodyContentWidget(
                text: 'В каком городе вы живёте?',
              ),
              CitiesWidget(),
            ],
          ),
        ),
      );
}

class CitiesWidget extends StatelessWidget {
  const CitiesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ScheduleBusBLoC, ScheduleBusState>(
        bloc: ScheduleBusScope.of(context).state.scheduleBusBloc,
        builder: (context, state) {
          if (state is ScheduleBusState$Processing) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ScheduleBusState$Error) {
            return Center(
              child: Text(state.message),
            );
          } else {
            if (state.data!.cities.isEmpty) {
              return const Center(
                child: Text('Города не найдены'),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: ListView.builder(
                  itemCount: state.data!.cities.length,
                  itemBuilder: (context, index) {
                    final city = state.data!.cities[index];
                    return Container(
                      margin: const EdgeInsets.only(top: 13.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          textAlign: TextAlign.center,
                          city.name,
                          softWrap: true,
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          ScheduleBusScope.of(context).state.setCityId =
                              city.id;

                          ScheduleBusScope.of(context).state.incrementIndex();
                        },
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}

class _BodyContentWidget extends StatelessWidget {
  const _BodyContentWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Image.asset(
          'assets/images/bus_shcedule.png',
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}

class AppBarForScheduleBusScreenWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarForScheduleBusScreenWidget({
    super.key,
    this.isSecondAndOtherScreen = false,
  });
  final bool isSecondAndOtherScreen;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).canvasColor,
      title: const Text(
        'Расписание\nавтобусов',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: isSecondAndOtherScreen
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Обработка нажатия кнопки "назад" здесь
                ScheduleBusScope.of(context).state.decrementIndex();
              },
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SecondScheduleBusScreen extends StatelessWidget {
  const _SecondScheduleBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarForScheduleBusScreenWidget(
        isSecondAndOtherScreen: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _BodyContentWidget(
              text: 'Маршрут на работу\nили с работы?',
            ),
            _ButtonForSecondScreen(
              text: "На работу",
            ),
            _ButtonForSecondScreen(
              text: 'С работы',
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonForSecondScreen extends StatelessWidget {
  const _ButtonForSecondScreen({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Container(
        margin: const EdgeInsets.only(top: 13.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            textAlign: TextAlign.center,
            text,
            softWrap: true,
            maxLines: 3,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          onTap: () {
            ScheduleBusScope.of(context).state.setRouteForJob = text;
            ScheduleBusScope.of(context).state.incrementIndex();
          },
        ),
      ),
    );
  }
}

class _ThirdScheduleBusScreen extends StatelessWidget {
  const _ThirdScheduleBusScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarForScheduleBusScreenWidget(
        isSecondAndOtherScreen: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _BodyContentWidget(
              text: 'В какое время?',
            ),
            _ButtonForThirdScreen(
              text: 'Утро',
            ),
            _ButtonForThirdScreen(
              text: 'Вечер',
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonForThirdScreen extends StatelessWidget {
  const _ButtonForThirdScreen({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Container(
        margin: const EdgeInsets.only(top: 13.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: ListTile(
            title: Text(
              textAlign: TextAlign.center,
              text,
              softWrap: true,
              maxLines: 3,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            onTap: () {
              ScheduleBusScope.of(context).state.setTimeOfDay = text;
              final stateInScope = ScheduleBusScope.of(context).state;
              final int cityId = stateInScope.cityId;
              final String timeOfDay = stateInScope.timesOfDay;
              final String routeForJob = stateInScope.routeForJob;

              stateInScope.scheduleBusBloc.add(
                  ScheduleBusEvent.fetchDestinations(
                      cityId: cityId,
                      timeOfDay: timeOfDay,
                      routeForJob: routeForJob));
              ScheduleBusScope.of(context).state.incrementIndex();
            }),
      ),
    );
  }
}

class DestinationListWidget extends StatelessWidget {
  const DestinationListWidget({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarForScheduleBusScreenWidget(),
      body: Column(
        children: [
          Text(
            'Маршруты по вашему запросу',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          BlocBuilder<ScheduleBusBLoC, ScheduleBusState>(
            bloc: ScheduleBusScope.of(context).state.scheduleBusBloc,
            builder: (context, state) {
              if (state is ScheduleBusState$Processing) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is ScheduleBusState$Error) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                if (state.data!.destinations.isEmpty) {
                  return const Center(
                    child: Text('Маршруты не найдены'),
                  );
                } else {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: ListView.builder(
                        itemCount: state.data!.destinations.length,
                        itemBuilder: (context, index) {
                          final destination = state.data!.destinations[index];
                          return Container(
                            margin: const EdgeInsets.only(top: 13.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Text(
                                textAlign: TextAlign.center,
                                destination.namePath,
                                softWrap: true,
                                maxLines: 3,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              onTap: () async {
                                await _launchUrl(destination.link);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
