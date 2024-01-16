import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:octopus/octopus.dart';

import '../../bloc/other_users_bloc/other_users_bloc.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SearchUserScreenState createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  Timer? searchDebounce;
  late final OtherUsersBloc blocOtherUsers;
  @override
  void initState() {
    blocOtherUsers = OtherUsersBloc(
        authRepository: DependenciesScope.of(context).authRepository,
        userRepo: DependenciesScope.of(context).userRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Найденные пользователи:',
                style: TextStyle(fontSize: 18),
              ),
            ),
            _ResultSearchWidget(blocOtherUsers),
          ],
        ),
      ),
    );
  }
}

class _ResultSearchWidget extends StatelessWidget {
  const _ResultSearchWidget(this.blocOtherUsers);
  final OtherUsersBloc blocOtherUsers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherUsersBloc, OtherUsersState>(
        bloc: blocOtherUsers,
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
                                    radius:
                                        MediaQuery.of(context).size.width / 8,
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
                            context.octopus.setState((stateRoute) => stateRoute
                              ..add(Routes.profileUser.node(
                                arguments: <String, String>{
                                  'id': state.data![index].autoCard.toString()
                                },
                              )));
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
