import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/ui/commons/news_card.dart';
import 'package:hr_app_flutter/ui/theme/app_colors.dart';

import '../bloc/moderation_news_bloc/moderation_news_bloc.dart';

class ModerationNewsScreen extends StatelessWidget {
  /// Экран массива новостей на модерации.
  const ModerationNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Bloc экрана.
    final cubit = context.watch<ModerationNewsCubit>();

    /// Массив модерируемых новостей из стейта.
    final moderationNews = cubit.state.moderationNews;

    return BlocBuilder<ModerationNewsCubit, ModerationNewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'События компании',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ),
            backgroundColor: AppColors.transparent,
            leading: IconButton(
              icon: Image.asset('assets/icons/chevrone_left.png'),
              onPressed: () {
                Navigator.of(context).pop();
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
                              state.counterWaitingAction ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.green,
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
                              state.counterPublished ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: cubit.state.moderationNews.isNotEmpty
                          ? moderationNews.map((item) => NewsCard(news: item)).toList()
                          : [],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
