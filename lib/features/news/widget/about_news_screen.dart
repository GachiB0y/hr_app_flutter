import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/news/widget/create_news_screen/create_news_screen.dart';
import 'package:intl/intl.dart';
import '../bloc/one_news_bloc/one_news_bloc.dart';

class AboutNewsScreen extends StatefulWidget {
  const AboutNewsScreen({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<AboutNewsScreen> createState() => _AboutNewsScreenState();
}

class _AboutNewsScreenState extends State<AboutNewsScreen> {
  late final OneNewsBloc blocNews;

  @override
  void initState() {
    super.initState();
    blocNews = OneNewsBloc(
      eventEntityRepository:
          DependenciesScope.of(context).eventEntityRepository,
    )..add(OneNewsEvent.fetch(id: widget.id!));
  }

  @override
  void dispose() {
    blocNews.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OneNewsBloc, OneNewsState>(
          bloc: blocNews,
          builder: (context, state) {
            return state.when(
                loading: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                loaded: (news) {
                  final date = DateFormat('dd MMMM').format(news.startDate);
                  final time = DateFormat('HH:mm').format(news.startDate);
                  final createdAt =
                      DateFormat('dd.MM.yy').format(news.createdAt);
                  return SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          leading: const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 4.0),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(136, 255, 255, 255)),
                              child: BackButton(),
                            ),
                          ),
                          expandedHeight: 274,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Image.network(
                              news.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          floating: true,
                          pinned: true,
                          snap: true,
                        ),
                        const SliverPadding(
                            padding: EdgeInsets.only(bottom: 43)),
                        SliverPadding(
                          padding: const EdgeInsets.only(left: 36),
                          sliver: SliverToBoxAdapter(
                            child: DisplayDateAndTimeWidget(
                                date: date, time: time),
                          ),
                        ),
                        const SliverPadding(
                            padding: EdgeInsets.only(bottom: 18)),
                        SliverPadding(
                          padding: const EdgeInsets.only(left: 36),
                          sliver: SliverToBoxAdapter(
                            child: Text(news.title,
                                style: Theme.of(context).textTheme.titleLarge),
                          ),
                        ),
                        const SliverPadding(
                            padding: EdgeInsets.only(bottom: 18)),
                        SliverPadding(
                          padding: const EdgeInsets.only(left: 36),
                          sliver: SliverToBoxAdapter(
                            child: Text(
                              news.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
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
                                  '${news.writer.firstName} ${news.writer.middleName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 17,
                                      ),
                                ),
                                Text('создано $createdAt',
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: () => const Center(child: Text('Nothing found...')));
          }),
    );
  }
}
