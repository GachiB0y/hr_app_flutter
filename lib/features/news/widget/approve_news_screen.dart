import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/router/router.dart';

import '../bloc/approvement_news_bloc/approvement_news_bloc.dart';

@RoutePage()
class ApproveNewsScreen extends StatefulWidget implements AutoRouteWrapper {
  const ApproveNewsScreen({
    super.key,
  });

  @override
  State<ApproveNewsScreen> createState() => _ApproveNewsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ApprovementNewsBloc>(
      create: (BuildContext context) => ApprovementNewsBloc(
        authRepository: DependenciesScope.of(context).authRepository,
        eventEntityRepository:
            DependenciesScope.of(context).eventEntityRepository,
      ),
      child: this,
    );
  }
}

class _ApproveNewsScreenState extends State<ApproveNewsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ApprovementNewsBloc>().add(const ApprovementEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    final blocApprovementNews = context.watch<ApprovementNewsBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: blocApprovementNews.state.when(
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          loaded: (loadedApprovementNews) {
            return ListView.builder(
              itemCount: loadedApprovementNews.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.pushRoute(AboutNewsRoute(
                      id: loadedApprovementNews[index].id,
                    ));
                  },
                  child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 100),
                      imageUrl: loadedApprovementNews[index].image,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                loadedApprovementNews[index].title,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                loadedApprovementNews[index].description,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Posted by: ${loadedApprovementNews[index].writer.firstName} ${loadedApprovementNews[index].writer.lastName}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      context.read<ApprovementNewsBloc>().add(
                                          ApprovementEvent.approvedNews(
                                              id: loadedApprovementNews[index]
                                                  .id
                                                  .toString()));
                                    },
                                    child: Text(
                                      'Подтвердить',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.redAccent)),
                                    onPressed: () {
                                      context.read<ApprovementNewsBloc>().add(
                                          ApprovementEvent.moveInArchiveNews(
                                              id: loadedApprovementNews[index]
                                                  .id
                                                  .toString()));
                                    },
                                    child: Text(
                                      'Отколнить',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                );
              },
            );
          },
          error: (e) => e == null
              ? const Text('Nothing found...')
              : Center(child: Text(e)),
        ),
      ),
    );
  }
}
