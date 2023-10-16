import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/other_users_bloc/other_users_bloc.dart';

import 'package:hr_app_flutter/domain/entity/user/user.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';
import 'package:hr_app_flutter/library/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/ui/screens/user_profile/user_profile_widget_model.dart';

@RoutePage()
class ProfileWidgetScreen extends StatefulWidget implements AutoRouteWrapper {
  final int userId;
  final AuthRepository authRepository;
  final UserRepository userRepo;
  const ProfileWidgetScreen({
    Key? key,
    required this.userId,
    required this.authRepository,
    required this.userRepo,
  }) : super(key: key);

  @override
  State<ProfileWidgetScreen> createState() => _ProfileWidgetScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<OtherUsersBloc>(
      create: (BuildContext context) => OtherUsersBloc(
        authRepository: authRepository,
        userRepo: userRepo,
      ),
      child: this,
    );
  }
}

class _ProfileWidgetScreenState extends State<ProfileWidgetScreen> {
  late final User user;

  late final UserProfileWidgetModel _model;
  @override
  void initState() {
    super.initState();
    _model = UserProfileWidgetModel();
    final blocOtherUsers = context.read<OtherUsersBloc>();
    blocOtherUsers.add(
        OtherUsersEvent.gethUsersByUserId(userId: widget.userId.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final blocOtherUsers = context.watch<OtherUsersBloc>();
    return ChangeNotifierProvaider<UserProfileWidgetModel>(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            SaveButtonWidget(),
          ],
        ),
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(16),
              child: blocOtherUsers.state.when(
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
                loaded: (listUserLoaded, user) {
                  if (user != null) {
                    return Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: Image.network(user.avatar).image,
                          radius: MediaQuery.of(context).size.width / 4,
                        ),
                        const SizedBox(height: 16),
                        Flexible(
                          child: Text(
                            '${user.name} ${user.nameI}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                            maxLines: 3,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.phone),
                            Text(
                              ' + ${user.phoneOne}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Flexible(
                              child: Text(
                                'Должность: ',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                user.staffPosition,
                                style: const TextStyle(fontSize: 16),
                                softWrap: true,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                        if (user.editTags) const TagsWidget()
                      ],
                    );
                  } else {
                    return const Center(
                      child: Text('СКЕЛЕТОН СКЕЛЕТОН СКЕЛЕТОН'),
                    );
                  }
                },
                error: (e) => e == null
                    ? const Text('Пользователь не найден.')
                    : Center(child: Text(e)),
              )),
        ),
      ),
    );
  }
}

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (ChangeNotifierProvaider.watch<
                ChangeNotifierProvaider<UserProfileWidgetModel>,
                UserProfileWidgetModel>(context) !=
            null &&
        ChangeNotifierProvaider.watch<
                ChangeNotifierProvaider<UserProfileWidgetModel>,
                UserProfileWidgetModel>(context)!
            .isSave) {
      return TextButton(
        child: const Text('Сохранить'),
        onPressed: () {},
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class TagsWidget extends StatefulWidget {
  const TagsWidget({super.key});

  @override
  _TagsWidgetState createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  List<String> tags = [];
  final tagController = TextEditingController();

  void addTag(String tag) {
    setState(() {
      tags.add(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8,
          children: tags.map((tag) => Chip(label: Text(tag))).toList(),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Введите название тега',
            suffixIcon: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                if (tagController.text.isNotEmpty) {
                  ChangeNotifierProvaider.read<
                          ChangeNotifierProvaider<UserProfileWidgetModel>,
                          UserProfileWidgetModel>(context)
                      ?.changeIsSave();
                  addTag(tagController.text);
                  tagController.clear();
                }
              },
            ),
          ),
          controller: tagController,
        ),
      ],
    );
  }
}
