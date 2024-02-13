import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/core/utils/date_formatter.dart';
import 'package:hr_app_flutter/features/news/bloc/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart';
import 'package:octopus/octopus.dart';

class ScrollNewsWidget extends StatefulWidget {
  const ScrollNewsWidget({super.key});

  @override
  State<ScrollNewsWidget> createState() => _ScrollNewsWidgetState();
}

class _ScrollNewsWidgetState extends State<ScrollNewsWidget> {
  @override
  void initState() {
    super.initState();
    context.read<EventEntityBloc>().add(const EventEntityEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    const radius = 18.0;
    return BlocBuilder<EventEntityBloc, EventEntityState>(
        builder: (context, state) {
      if (state is EventEntityState$Processing) {
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      } else if (state is EventEntityState$Error) {
        return const SliverToBoxAdapter(
            child: Center(child: Text('Ошибка загрузки сервисов!')));
      } else {
        if (state.data == null) {
          return const SliverToBoxAdapter(
              child: Center(child: Text('Ничего не найденно!')));
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              // itemExtent: MediaQuery.of(context).size.width / 1.5,
              // scrollDirection: Axis.horizontal,
              // padding: const EdgeInsets.all(16),
              // itemCount: state.data!.listEventEntityLoaded
              // .length, // начинаем с выбранной вкладки

              (BuildContext context, int index) {
                EventEntity item =
                    state.data!.listEventEntityLoaded.reversed.toList()[index];
                // получаем элемент для текущей вкладки

                final String dateInfo = formatDateTimeRange(
                    start: item.startDate, end: item.endDate);
                return GestureDetector(
                  onTap: () {
                    context.octopus.setState((stateRoute) => stateRoute
                      ..add(Routes.aboutNews.node(
                        arguments: <String, String>{'id': item.id.toString()},
                      )));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: 9.0, left: index == 0 ? 25 : 0),
                    child: SizedBox(
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CachedNetworkImage(
                                fadeInDuration:
                                    const Duration(milliseconds: 100),
                                imageUrl: item.image,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.6,
                                    height: MediaQuery.of(context).size.height /
                                        6.9,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                      color: Colors.grey,
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0, bottom: 8.0),
                                          child: Container(
                                            padding: const EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(radius),
                                            ),
                                            child: Text(
                                              dateInfo,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2.6,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                item.title,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: state.data!.listEventEntityLoaded.length,
            ),
          );
        }
      }
    });
  }
}
