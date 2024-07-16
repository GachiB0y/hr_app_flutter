import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/bloc/moderation_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_news_screen/create_news_screen.dart';
import 'package:hr_app_flutter/ui/commons/blur_image_widget.dart';
import 'package:hr_app_flutter/ui/library/scaffold_manager/scaffold_manager.dart';
import 'package:hr_app_flutter/ui/theme/app_colors.dart';

class ModerationNewsScreen extends StatelessWidget {
  /// Экран выбраной новости для модерации.
  const ModerationNewsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ModerationNewsCubit>();
    final news = context.select((ModerationNewsCubit value) => value.state.news);
    return BlocBuilder<ModerationNewsCubit, ModerationNewsState>(
      builder: (context, state) {
        return ScaffoldManager(
          appBar: AppBar(
            title: state.valueState == null
                ? Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Ждет публикации',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        splashColor: AppColors.green.withOpacity(0.3),
                        onTap: () {
                          if (news?.id == 0) return;
                          cubit.openActionSheet(context: context, id: news?.id ?? 0);
                        },
                        child: const Icon(
                          Icons.more_horiz_outlined,
                          size: 35,
                        ),
                      ),
                    ],
                  )
                : null,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Image.asset('assets/icons/chevrone_left.png'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          status: state.status,
          body: state.valueState == null
              ? SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.zero,
                        sliver: SliverToBoxAdapter(
                          child: BlurImageWidget(urlImage: news?.image ?? ''),
                        ),
                      ),
                      const SliverPadding(padding: EdgeInsets.only(bottom: 43)),
                      SliverPadding(
                        padding: const EdgeInsets.only(left: 36),
                        sliver: SliverToBoxAdapter(
                          child: DisplayDateAndTimeWidget(date: state.date ?? '', time: state.time ?? ''),
                        ),
                      ),
                      const SliverPadding(padding: EdgeInsets.only(bottom: 18)),
                      SliverPadding(
                        padding: const EdgeInsets.only(left: 36),
                        sliver: SliverToBoxAdapter(
                          child: Text(news?.title ?? '', style: Theme.of(context).textTheme.titleLarge),
                        ),
                      ),
                      const SliverPadding(padding: EdgeInsets.only(bottom: 18)),
                      SliverPadding(
                        padding: const EdgeInsets.only(left: 36),
                        sliver: SliverToBoxAdapter(
                          child: Text(
                            news?.description ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.only(left: 36, top: 40),
                        sliver: SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${news?.writer?.firstName} ${news?.writer?.middleName}',
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      fontSize: 17,
                                    ),
                              ),
                              Text('создано ${state.createAt}',
                                  style: Theme.of(context).textTheme.titleSmall),
                            ],
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        sliver: SliverToBoxAdapter(
                          child: InkWell(
                            onTap: () {
                              if (news == null) return;
                              cubit.publishOrRejectNews(value: true, id: news.id.toString());
                            },
                            child: Container(
                              height: 57,
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: double.infinity,
                              child: const Center(
                                child: Text(
                                  'Опубликовать',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : _PublishNewsScreen(
                  title: news?.title ?? '',
                  value: state.valueState ?? true,
                ),
        );
      },
    );
  }
}

class _PublishNewsScreen extends StatelessWidget {
  /// Название новости.
  final String title;

  /// Значение опубликована новость или отклонена.
  final bool value;

  const _PublishNewsScreen({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42),
        child: Column(
          children: [
            const SizedBox(height: 110),
            Image.asset(value ? 'assets/images/ok.png' : 'assets/images/cancel.png'),
            const SizedBox(height: 30),
            Text(
              value ? 'Запись опубликована' : 'Запись отклонена',
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: SizedBox(
                height: 200,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
