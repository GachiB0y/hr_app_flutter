import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    );
    blocScheduleBus.add(const ScheduleBusEvent.fetch());
  }

  @override
  void dispose() {
    blocScheduleBus.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: const Text(
          'Список городов',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
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
                  return ListView.builder(
                    itemCount: scheduleBus.result.length,
                    itemBuilder: (context, index) {
                      final city = scheduleBus.result[index];
                      return Container(
                        margin: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            city.country,
                            softWrap: true,
                            maxLines: 3,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DestinationListWidget(city: city),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                error: (e) => e == null
                    ? const Center(child: Text('Ошибка загрузки.'))
                    : Center(child: Text(e)),
              );
            }),
      ),
    );
  }
}

class DestinationListWidget extends StatefulWidget {
  final City city;

  const DestinationListWidget({super.key, required this.city});

  @override
  State<DestinationListWidget> createState() => _DestinationListWidgetState();
}

class _DestinationListWidgetState extends State<DestinationListWidget> {
  late ScrollController _scrollController;
  bool _isListViewVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _isListViewVisible = false;
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _isListViewVisible = true;
      });
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url0');
    }
  }

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Маршруты (${widget.city.country})',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemExtent: 100 * textScaleFactor,
        controller: _scrollController,
        itemCount: widget.city.destinations.length,
        itemBuilder: (context, index) {
          final destination = widget.city.destinations[index];
          return Container(
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              title: Text(destination.namePath),
              onTap: () async {
                await _launchUrl(destination.link);
              },
            ),
          );
        },
      ),
      floatingActionButton: _isListViewVisible
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                // Действие, которое должно выполняться при нажатии на FloatingActionButton
              },
              child: const Icon(Icons.arrow_downward),
            )
          : null,
    );
  }
}
