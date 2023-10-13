import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/other_users_bloc/other_users_bloc.dart';

import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';

@RoutePage()
class SearchUserScreen extends StatefulWidget implements AutoRouteWrapper {
  const SearchUserScreen(
      {Key? key, required this.authRepository, required this.userRepo})
      : super(key: key);
  final AuthRepository authRepository;
  final UserRepository userRepo;
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
  String findText = '';
  String amountCoins = '';

  @override
  void initState() {
    super.initState();
    context.read<OtherUsersBloc>().add(const OtherUsersEvent.clearList());
  }

  @override
  Widget build(BuildContext context) {
    final blocOtherUsers = context.watch<OtherUsersBloc>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: ColorsForWidget.colorGreen,
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {
                blocOtherUsers
                    .add(OtherUsersEvent.findUsers(findText: findText));
              },
              icon: const Icon(Icons.search),
            ),
            hintText: 'Введите ФИО',
            filled: true,
            fillColor: Colors.white,
            border: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
          ),
          onChanged: (value) {
            setState(() {
              findText = value;
            });
          },
        ),
        actions: [],
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
            blocOtherUsers.state.when(
              loaded: (listUsersLoaded, currentUserProfile) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listUsersLoaded.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              Image.network(listUsersLoaded[index].avatar)
                                  .image,
                          radius: MediaQuery.of(context).size.width / 8,
                        ),
                        title: Text(
                            '${listUsersLoaded[index].nameI} ${listUsersLoaded[index].name}'),
                        subtitle: Text(listUsersLoaded[index].staffPosition),
                        onTap: () {
                          context.pushRoute(ProfileWidgetRoute(
                            userId: listUsersLoaded[index].autoCard,
                            authRepository: blocOtherUsers.authRepository,
                            userRepo: blocOtherUsers.userRepo,
                          ));
                        },
                      );
                    },
                  ),
                );
              },
              loading: () {
                return const SizedBox.shrink();
              },
              error: (e) => const SafeArea(
                  child: Center(child: Text('Пользователь не найден.'))),
            )
          ],
        ),
      ),
    );
  }
}
