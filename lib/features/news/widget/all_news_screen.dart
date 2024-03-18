import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/bloc/caregory_bloc.dart/category_bloc.dart';
import 'package:hr_app_flutter/features/news/bloc/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart';
import 'package:intl/intl.dart';
import 'package:octopus/octopus.dart';

/// {@template all_news_screen}
/// AllNewsScreen widget.
/// {@endtemplate}
class AllNewsScreen extends StatelessWidget {
  /// {@macro all_news_screen}
  const AllNewsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: const Column(
          children: [
            ScrollCategoriesWidget(),
            Expanded(child: ScrollContentWithNews()),
          ],
        ),
      );
}

/// {@template all_news_screen}
/// ScrollCategoriesWidget widget.
/// {@endtemplate}
class ScrollCategoriesWidget extends StatefulWidget {
  /// {@macro all_news_screen}
  const ScrollCategoriesWidget({super.key});

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.

  static _ScrollCategoriesWidgetState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_ScrollCategoriesWidgetState>();

  @override
  State<ScrollCategoriesWidget> createState() => _ScrollCategoriesWidgetState();
}

/// State for widget ScrollCategoriesWidget.
class _ScrollCategoriesWidgetState extends State<ScrollCategoriesWidget> {
  List<int> selectedCategories = [1];

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(const CategoryEvent.fetch());
  }

  void selectItem(int item) {
    setState(() {
      if (selectedCategories.isNotEmpty) {
        selectedCategories.removeLast();
      }
      selectedCategories.add(item);

      // if (selectedCategories.contains(item)) {
      //   selectedCategories.remove(item);
      // } else {

      //   selectedCategories.add(item);
      // }
    });
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CategoryBloc, CategoryState>(
        builder: (BuildContext context, state) {
          if (state is CategoryState$Error) {
            return const Center(
              child: Text('Ошибка загрузки.'),
            );
          } else if (state is CategoryState$Processing) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else {
            return (state.data!.isEmpty)
                ? const SizedBox.shrink()
                : SizedBox(
                    height: 60,
                    child: CustomScrollView(
                      scrollDirection: Axis.horizontal,
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              final double leftPadding =
                                  index == 0 ? 25.0 : 8.0;
                              final double rightPadding =
                                  index == state.data!.length ? 25.0 : 8.0;
                              bool isSelected = selectedCategories
                                  .contains(state.data![index].id);
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: leftPadding,
                                    right: rightPadding,
                                    top: 10,
                                    bottom: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    selectItem(state.data![index].id);
                                    context.read<EventEntityBloc>().add(
                                          EventEntityEvent.update(
                                            idTab: state.data![index].id,
                                          ),
                                        );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 0,
                                          blurRadius: 8,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: isSelected
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .background,
                                    ),
                                    child: Text(
                                      state.data![index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(fontSize: 10),
                                    ),
                                  ),
                                ),
                              );
                            },
                            childCount: state.data!.length,
                          ),
                        ),
                      ],
                    ),
                  );
          }
        },
      );
}

/// {@template all_news_screen}
/// ScrollContentWithNews widget.
/// {@endtemplate}
class ScrollContentWithNews extends StatefulWidget {
  /// {@macro all_news_screen}
  const ScrollContentWithNews({super.key});

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  static _ScrollContentWithNewsState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_ScrollContentWithNewsState>();

  @override
  State<ScrollContentWithNews> createState() => _ScrollContentWithNewsState();
}

/// State for widget ScrollContentWithNews.
class _ScrollContentWithNewsState extends State<ScrollContentWithNews> {
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<EventEntityBloc, EventEntityState>(
        builder: (BuildContext context, state) {
          if (state is CategoryState$Error) {
            return const Center(
              child: Text('Ошибка загрузки.'),
            );
          } else if (state is CategoryState$Processing) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else {
            if (state.data!.filteredListEventEntity.isEmpty) {
              return const SizedBox.shrink();
            } else {
              final news = state.data!.filteredListEventEntity;
              return Scrollbar(
                thumbVisibility: true,
                thickness: 10,
                radius: const Radius.circular(10),
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return _OneNewsElementWidget(
                            news: news[index],
                          );
                        },
                        childCount: state.data!.filteredListEventEntity.length,
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      );
}

class _OneNewsElementWidget extends StatelessWidget {
  const _OneNewsElementWidget({
    super.key,
    required this.news,
  });

  final EventEntity news;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.octopus.setState((state) {
          var findSate = state..findByName('all-news');
          findSate.add(Routes.aboutNews.node(
            arguments: <String, String>{'id': news.id.toString()},
          ));

          return state;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 8.0,
          left: 15.0,
          right: 30.0,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 11.0, bottom: 9.0, right: 11.0, left: 11.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  news.image,
                  fit: BoxFit.fill,
                  height: 90,
                  width: 107,
                ),
              ),
              const SizedBox(
                width: 22,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _InfoDateWidget(
                      text: DateFormat('dd MMMM').format(
                        news.startDate,
                      ),
                    ),
                    Text(
                      news.title,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      news.description,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.outline),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoDateWidget extends StatelessWidget {
  const _InfoDateWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(145),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 9,
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
