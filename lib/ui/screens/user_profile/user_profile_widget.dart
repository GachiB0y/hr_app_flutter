import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/other_users_bloc/other_users_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/user_bloc/user_bloc.dart';

import 'package:hr_app_flutter/domain/entity/user/user.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';
import 'package:hr_app_flutter/library/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';
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
    final blocUser = context.watch<UserBloc>();
    final stateBlocUser = blocUser.state as UserStateLoaded;
    return ChangeNotifierProvaider<UserProfileWidgetModel>(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            SaveButtonWidget(),
          ],
        ),
        body: SafeArea(
          child: blocOtherUsers.state.when(
            loading: (listUsersLoaded, currentUserProfile) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
            loaded: (listUserLoaded, user) {
              if (user != null) {
                double radius = MediaQuery.of(context).size.width / 4;

                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: radius,
                                  backgroundImage:
                                      Image.network(user.avatar).image,
                                ),
                                stateBlocUser.userLoaded.autoCard ==
                                        user.autoCard
                                    ? Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: ColorsForWidget.colorGrey,
                                            shape: BoxShape.circle,
                                          ),
                                          child: IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () {
                                              // Действия при нажатии на иконку редактирования
                                            },
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '${user.name} ${user.nameI}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: true,
                              maxLines: 3,
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
                            const TagsWidget()
                          ],
                        ),
                      ),
                    ),
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
          ),
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
    final blocOtherUsers = context.watch<OtherUsersBloc>();

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
        onPressed: () {
          final currentProfileUser =
              (blocOtherUsers.state as OtherUserStateLoaded).currentProfileUser;
          blocOtherUsers.add(OtherUsersEvent.saveTagsToSend(
              tags: currentProfileUser!.tags,
              userId: currentProfileUser.autoCard));
          ChangeNotifierProvaider.read<
                  ChangeNotifierProvaider<UserProfileWidgetModel>,
                  UserProfileWidgetModel>(context)
              ?.changeIsSave(false);
        },
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
  List<TagUser> tags = [];
  final tagController = TextEditingController();

  void addTag(String tag) {
    setState(() {
      final newTagUSer = TagUser(id: null, name: tag);
      tags.add(newTagUSer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final blocOtherUsers = context.watch<OtherUsersBloc>();
    final tags =
        (blocOtherUsers.state as OtherUserStateLoaded).currentProfileUser?.tags;

    return Column(
      children: [
        Wrap(
          spacing: 8,
          children: tags!
              .map((tag) => Chip(
                    label: Text(tag.name),
                    onDeleted: () {
                      ChangeNotifierProvaider.read<
                              ChangeNotifierProvaider<UserProfileWidgetModel>,
                              UserProfileWidgetModel>(context)
                          ?.changeIsSave(true);
                      blocOtherUsers.add(OtherUsersEvent.deleteTag(tag: tag));
                    },
                    deleteIcon: const Icon(Icons.close),
                    deleteButtonTooltipMessage: 'Удалить',
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.grey[200],
                  ))
              .toList(),
        ),
        const SizedBox(height: 16),
        if ((blocOtherUsers.state as OtherUserStateLoaded)
            .currentProfileUser!
            .editTags)
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
                        ?.changeIsSave(true);

                    blocOtherUsers.add(OtherUsersEvent.addTag(
                        tag: TagUser(id: null, name: tagController.text)));
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
