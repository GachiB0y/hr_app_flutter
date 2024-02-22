import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/schedule_bus_bloc/schedule_bus_bloc.dart';
import '../../model/schedule_bus_entity/schedule_bus_entity.dart';

class ScheduleBusScreen extends StatefulWidget {
  const ScheduleBusScreen({
    super.key,
  });

  @override
  State<ScheduleBusScreen> createState() => _ScheduleBusScreenState();
}

class _ScheduleBusScreenState extends State<ScheduleBusScreen> {
  late final ScheduleBusBloc blocScheduleBus;
  @override
  void initState() {
    super.initState();
    blocScheduleBus = ScheduleBusBloc(
      serviceRepository: DependenciesScope.of(context).serviceRepository,
    )..add(const ScheduleBusEvent.fetch());
  }

  @override
  void dispose() {
    blocScheduleBus.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarForScheduleBusScreenWidget(),
      body: SafeArea(
        child: Column(
          children: [
            const _BodyContentWidget(
              text: 'В каком городе вы живёте?',
            ),
            Expanded(
              child: BlocBuilder<ScheduleBusBloc, ScheduleBusState>(
                bloc: blocScheduleBus,
                builder: (context, state) {
                  return state.when(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                    loaded: (scheduleBus) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: ListView.builder(
                          itemCount: scheduleBus.result.length,
                          itemBuilder: (context, index) {
                            final city = scheduleBus.result[index];
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
                                  city.country,
                                  softWrap: true,
                                  maxLines: 3,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const _SecondScheduleBusScreen(),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                    error: (e) => e == null
                        ? const Center(child: Text('Ошибка загрузки.'))
                        : Center(child: Text(e)),
                  );
                },
              ),
            ),
          ],
        ),
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
  });

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
      appBar: AppBarForScheduleBusScreenWidget(),
      body: SafeArea(
        child: Column(
          children: [
            _BodyContentWidget(
              text: 'Маршрут на работу\nили с работы?',
            ),
            _ButtonForSecondScreen(
              text: "На работу",
              indexRouteBus: 0,
            ),
            _ButtonForSecondScreen(
              text: 'С работы',
              indexRouteBus: 1,
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
    required this.indexRouteBus,
    required this.text,
  });
  final int indexRouteBus;
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
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _ThirdScheduleBusScreen(
                indexRouteBus: indexRouteBus,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThirdScheduleBusScreen extends StatelessWidget {
  const _ThirdScheduleBusScreen({super.key, required this.indexRouteBus});

  /// 0-To work; 1-From the job
  final int indexRouteBus;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarForScheduleBusScreenWidget(),
      body: SafeArea(
        child: Column(
          children: [
            _BodyContentWidget(
              text: 'В какое время?',
            ),
            _ButtonForThirdScreen(
              text: 'Утро',
              indexTime: 0,
            ),
            _ButtonForThirdScreen(
              text: 'Вечер',
              indexTime: 1,
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
    required this.indexTime,
    required this.text,
  });

  /// 0 - Morning
  /// 1 - Evening
  final int indexTime;

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
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DestinationListWidget()),
          ),
        ),
      ),
    );
  }
}

class DestinationListWidget extends StatefulWidget {
  const DestinationListWidget({super.key});

  @override
  State<DestinationListWidget> createState() => _DestinationListWidgetState();
}

class _DestinationListWidgetState extends State<DestinationListWidget> {
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
        ],
      ),
    );
  }
}

// class DestinationListWidget extends StatefulWidget {
//   final City city;

//   const DestinationListWidget({super.key, required this.city});

//   @override
//   State<DestinationListWidget> createState() => _DestinationListWidgetState();
// }

// class _DestinationListWidgetState extends State<DestinationListWidget> {
//   late ScrollController _scrollController;
//   bool _isListViewVisible = true;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _scrollController.addListener(_handleScroll);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _handleScroll() {
//     if (_scrollController.position.userScrollDirection ==
//         ScrollDirection.reverse) {
//       setState(() {
//         _isListViewVisible = false;
//       });
//     } else if (_scrollController.position.userScrollDirection ==
//         ScrollDirection.forward) {
//       setState(() {
//         _isListViewVisible = true;
//       });
//     }
//   }

//   Future<void> _launchUrl(String url) async {
//     final Uri url0 = Uri.parse(url);
//     if (!await launchUrl(url0)) {
//       throw Exception('Could not launch $url0');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double textScaleFactor = MediaQuery.of(context).textScaleFactor;
//     if (textScaleFactor < 1) textScaleFactor = 1;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Маршруты (${widget.city.country})',
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemExtent: 100 * textScaleFactor,
//         controller: _scrollController,
//         itemCount: widget.city.destinations.length,
//         itemBuilder: (context, index) {
//           final destination = widget.city.destinations[index];
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: DecoratedBox(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primary,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     blurRadius: 5,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: ListTile(
//                 title: Text(destination.namePath),
//                 onTap: () async {
//                   await _launchUrl(destination.link);
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: _isListViewVisible
//           ? FloatingActionButton(
//               backgroundColor: Theme.of(context).colorScheme.primary,
//               onPressed: () {
//                 // Действие, которое должно выполняться при нажатии на FloatingActionButton
//               },
//               child: const Icon(Icons.arrow_downward),
//             )
//           : null,
//     );
//   }
// }
