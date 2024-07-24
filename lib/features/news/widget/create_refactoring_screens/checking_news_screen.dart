import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart';
import 'package:hr_app_flutter/features/news/widget/create_news_screen/create_news_screen.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/banner_checking_news.dart';
import 'package:intl/intl.dart';
import 'package:octopus/octopus.dart';

class CheckingNewsScreen extends StatelessWidget {

  /// Данные созданной новости.
  final EventEntity news;
  final File file;
  /// Экран созданной новости на проверке.
  const CheckingNewsScreen({
    required this.news,
    required this.file,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final date = DateFormat('dd MMMM').format(news.startDate!);
    final time = DateFormat('HH:mm').format(news.startDate!);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                context.octopus
                    .setState((state) => state..removeByName(Routes.createModerationScreensBucket.name));
              },
            ),
            actions: [TextButton(
                onPressed: () {
                  context.octopus
                      .setState((state) => state..removeByName(Routes.createModerationScreensBucket.name));
                },
                child: const Text('Выход')) ],
          ),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.zero,
                  sliver: SliverToBoxAdapter(
                    child: BannerCheckingNews(),

                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.zero,
                  sliver: SliverToBoxAdapter(
                    child: Image.file(file),

                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 43)),
                SliverPadding(
                  padding: const EdgeInsets.only(left: 36),
                  sliver: SliverToBoxAdapter(
                    child: DisplayDateAndTimeWidget(date: date, time: time),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 18)),
                SliverPadding(
                  padding: const EdgeInsets.only(left: 36),
                  sliver: SliverToBoxAdapter(
                    child: Text(news.title ?? '', style: Theme.of(context).textTheme.titleLarge),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 18)),
                SliverPadding(
                  padding: const EdgeInsets.only(left: 36),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      news.description ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
