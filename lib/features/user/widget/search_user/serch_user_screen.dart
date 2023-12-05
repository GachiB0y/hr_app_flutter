import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:hr_app_flutter/router/router.dart';

import '../../bloc/other_users_bloc/other_users_bloc.dart';

@RoutePage()
class SearchUserScreen extends StatefulWidget implements AutoRouteWrapper {
  const SearchUserScreen(
      {Key? key, required this.authRepository, required this.userRepo})
      : super(key: key);
  final IAuthRepository authRepository;
  final IUserRepository userRepo;
  @override
  _SearchUserScreenState createState() => _SearchUserScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<OtherUsersBloc>(
      create: (BuildContext context) =>
          OtherUsersBloc(authRepository: authRepository, userRepo: userRepo),
      child: this,
    );
  }
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  Timer? searchDebounce;

  @override
  void initState() {
    super.initState();
    context.read<OtherUsersBloc>().add(const OtherUsersEvent.clearList());
  }

  @override
  Widget build(BuildContext context) {
    final blocOtherUsers = context.watch<OtherUsersBloc>();
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            hintText: 'Введите ФИО',
            filled: true,
            fillColor: Colors.white,
            border: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              searchDebounce?.cancel();
              searchDebounce = Timer(const Duration(milliseconds: 700), () {
                blocOtherUsers.add(OtherUsersEvent.findUsers(findText: value));
              });
            }
          },
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Center(
              child: Text(
                'Найденные пользователи:',
                style: TextStyle(fontSize: 18),
              ),
            ),
            _ResultSearchWidget(),
          ],
        ),
      ),
    );
  }
}

class _ResultSearchWidget extends StatelessWidget {
  const _ResultSearchWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherUsersBloc, OtherUsersState>(
        builder: (context, state) {
      if (state is OtherUsersState$Processing) {
        const SizedBox.shrink();
      } else if (state is OtherUsersState$Idle ||
          state is OtherUsersState$Successful) {
        if (state.data != null) {
          return Expanded(
            child: ListView.builder(
              itemExtent: 84,
              itemCount: state.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: SizedBox(
                        width: MediaQuery.of(context).size.width / 8,
                        child: CachedNetworkImage(
                            imageUrl: state.data![index].avatar,
                            imageBuilder: (context, imageProvider) {
                              return CircleAvatar(
                                backgroundImage: imageProvider,
                                radius: MediaQuery.of(context).size.width / 8,
                              );
                            }),
                      ),
                      title: Text(
                        '${state.data![index].nameI} ${state.data![index].name} ${state.data![index].nameO}',
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        state.data![index].staffPosition,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        context.pushRoute(ProfileWidgetRoute(
                          userId: state.data![index].autoCard,
                          authRepository:
                              RepositoryProvider.of<IAuthRepository>(context),
                          userRepo:
                              RepositoryProvider.of<IUserRepository>(context),
                        ));
                      },
                    ),
                    const Divider(
                      height: 2,
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return const Center(child: Text('Пользователь не найден.'));
        }
      }
      return const Center(child: Text('Пользователь не найден.'));
    });
  }
}
