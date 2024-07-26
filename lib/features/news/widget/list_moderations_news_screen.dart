import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/bloc/moderation_news_bloc/list_moderation_news_bloc.dart';
import 'package:hr_app_flutter/ui/commons/news_card.dart';
import 'package:octopus/octopus.dart';

class ListModerationNewsScreen extends StatelessWidget {
  /// Экран массива новостей на модерации.
  const ListModerationNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Bloc экрана.
    final cubit = context.read<ListModerationNewsCubit>();

    /// Массив модерируемых новостей из стейта.
    final moderationNews = context.select((ListModerationNewsCubit value) => value.state.moderationNews);

    return BlocBuilder<ListModerationNewsCubit, ListModerationNewsState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'События компании',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Image.asset('assets/icons/chevrone_left.png'),
            onPressed: () {
              context.octopus.setState(
                (state) => state
                  ..findByName('${Routes.services.name}-tab')?.add(
                    Routes.services.node(),
                  ),
              );
            },
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Ждут действий',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            state.counterWaitingAction,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          const Text(
                            'Опубликованные',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            state.counterPublished ?? '0',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: cubit.state.moderationNews.isNotEmpty
                        ? moderationNews
                            .map(
                              (item) => NewsCard(
                                onTap: () {
                                  if(context.octopus.state.location.contains('refactor-news')) return;
                                  context.octopus.setState(
                                    (state) => state
                                      ..findByName('${Routes.services.name}-tab')?.add(
                                        Routes.moderationNewsScreen
                                            .node(arguments: {'id': item.id.toString()}),
                                      ),
                                  );
                                },
                                news: item,
                              ),
                            )
                            .toList()
                        : [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
