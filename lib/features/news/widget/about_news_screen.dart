import 'package:flutter/material.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/core/utils/date_formatter.dart';
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
      authRepository: DependenciesScope.of(context).authRepository,
      eventEntityRepository:
          DependenciesScope.of(context).eventEntityRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: blocNews.state.when(
          loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
          loaded: (news) {
            final String dateInfo =
                formatDateTimeRange(start: news.startDate, end: news.endDate);
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height / 2.5,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(fit: StackFit.expand, children: [
                        Image.network(
                          news.image,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 16.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  dateInfo,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  news.title,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                    floating: true,
                    pinned: true,
                    snap: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Автор:',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                  '${news.writer.firstName} ${news.writer.middleName}'),
                            ],
                          ),
                          subtitle: Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Описание:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Wrap(children: [
                                  Text(news.description),
                                ]),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              ),
            );
          },
          error: () => const Text('Nothing found...')),
    );
  }
}
