import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/auth/widget/auth_scope.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/user/bloc/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/features/user/widget/user_scope.dart';
import 'package:hr_app_flutter/router/router.dart';

import '../../bloc/other_users_bloc/other_users_bloc.dart';
import '../../model/user/user.dart';

@RoutePage()
class ProfileWidgetScreen extends StatefulWidget implements AutoRouteWrapper {
  final int userId;
  const ProfileWidgetScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<ProfileWidgetScreen> createState() => _ProfileWidgetScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<OtherUsersBloc>(
      create: (BuildContext context) => OtherUsersBloc(
        authRepository: DependenciesScope.of(context).authRepository,
        userRepo: DependenciesScope.of(context).userRepository,
      ),
      child: this,
    );
  }
}

class _ProfileWidgetScreenState extends State<ProfileWidgetScreen> {
  late final User user;

  @override
  void initState() {
    super.initState();
    final blocUsers = context.read<UserBloc>();
    blocUsers.add(UserEvent.gethUserByUserId(userId: widget.userId.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return UserScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          actions: const [
            SaveButtonWidget(),
            LogoutButtonWidget(),
          ],
        ),
        body: const SafeArea(child: UserInfoForm()),
      ),
    );
  }
}

class UserInfoForm extends StatelessWidget {
  const UserInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserState$Processing) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (state is UserState$Idle || state is UserState$Successful) {
        if (state.data!.currentProfileUser == null) {
          return const Text('СКЕЛЕТОН СКЕЛЕТОН СКЕЛЕТОН');
        } else {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    children: [
                      const AvatarProfileWidget(),
                      const SizedBox(height: 16),
                      Text(
                        '${state.data!.currentProfileUser!.name} ${state.data!.currentProfileUser!.nameI}',
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
                            ' + ${state.data!.currentProfileUser!.phoneOne}',
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
                              state.data!.currentProfileUser!.staffPosition,
                              style: const TextStyle(fontSize: 16),
                              softWrap: true,
                              maxLines: 6,
                            ),
                          ),
                        ],
                      ),
                      const TagsWidget(),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      } else {
        return const Center(child: Text('Пользователь не найден.'));
      }
    });
  }
}

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (UserScope.of(context).state.isSave == true) {
      return const SizedBox.shrink();
    } else {
      return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return state.data!.currentProfileUser == null
            ? const SizedBox.shrink()
            : state.data!.currentProfileUser!.self
                ? Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                    ),
                    child: Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(70, 255, 255, 255),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          AuthScope.of(context).signOut();

                          // context.router.removeLast();
                          context.router.replaceAll([const LoaderRoute()]);
                          // context.router.stackData.clear();
                          // context.router.pushNamed('/');
                        },
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(2),
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.logout,
                          size: 35,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink();
      });
    }
  }
}

class AvatarProfileWidget extends StatelessWidget {
  const AvatarProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double radius = MediaQuery.of(context).size.width / 4;

    final viewModel = UserScope.of(context);

    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserState$Successful || state is UserState$Idle) {
        return state.data == null
            ? const SizedBox.shrink()
            : state.data!.currentProfileUser == null
                ? const SizedBox.shrink()
                : Stack(
                    children: [
                      CachedNetworkImage(
                          imageUrl: state.data!.currentProfileUser!.avatar,
                          imageBuilder: (context, imageProvider) {
                            return CircleAvatar(
                              radius: radius,
                              backgroundImage: viewModel
                                          .state.myImage.imageFile !=
                                      null
                                  ? FileImage(
                                      viewModel.state.myImage.imageFile as File)
                                  : imageProvider,
                            );
                          }),
                      state.data!.currentProfileUser!.self
                          ? Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.outline,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () async {
                                    /// Действия при нажатии на иконку редактирования
                                    await UserScope.of(context, listen: false)
                                        .state
                                        .selectImage();
                                    final imageFile =
                                        UserScope.of(context, listen: false)
                                            .state
                                            .myImage
                                            .imageFile;
                                    if (imageFile != null) {
                                      final File file = File(imageFile.path);
                                      if (context.mounted) {
                                        UserScope.of(context, listen: false)
                                            .state
                                            .file = file;
                                        UserScope.of(context, listen: false)
                                            .state
                                            .changeIsSave(
                                                newValue: true, isTags: false);
                                      }
                                    }
                                  },
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (UserScope.of(context).state.isSave) {
      return TextButton(
        child: const Text('Сохранить'),
        onPressed: () {
          final blocUsers = context.read<UserBloc>();
          final currentProfileUser = blocUsers.state.data?.currentProfileUser;
          final isChangeTags =
              UserScope.of(context, listen: false).state.isChangeTags;

          if (currentProfileUser == null) return;
          if (isChangeTags == true) {
            blocUsers.add(UserEvent.saveTagsToSend(
                tags: currentProfileUser.tags,
                userId: currentProfileUser.autoCard));
          }
          if (UserScope.of(context, listen: false).state.file != null) {
            blocUsers.add(UserEvent.sendAvatarWithProfile(
                userId: currentProfileUser.autoCard,
                imageFile:
                    UserScope.of(context, listen: false).state.file as File));
          }

          UserScope.of(context, listen: false)
              .state
              .changeIsSave(newValue: false, isTags: false);
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
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserState$Processing) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is UserState$Error) {
        return const Text('Ошибка загрузки тэгов');
      } else {
        return state.data != null
            ? state.data!.currentProfileUser != null
                ? Column(
                    children: [
                      Wrap(
                        spacing: 8,
                        children: state.data!.currentProfileUser!.tags
                            .map((tag) => Chip(
                                  label: Text(tag.name),
                                  onDeleted: () {
                                    UserScope.of(context, listen: false)
                                        .state
                                        .changeIsSave(
                                            newValue: true, isTags: true);
                                    context
                                        .read<UserBloc>()
                                        .add(UserEvent.deleteTag(tag: tag));
                                  },
                                  deleteIcon: const Icon(
                                    Icons.close,
                                    size: 20,
                                  ),
                                  deleteButtonTooltipMessage: 'Удалить',
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      state.data!.currentProfileUser!.editTags
                          ? TextField(
                              decoration: InputDecoration(
                                labelText: 'Введите название тега',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    if (tagController.text.isNotEmpty) {
                                      UserScope.of(context, listen: false)
                                          .state
                                          .changeIsSave(
                                              newValue: true, isTags: true);

                                      context.read<UserBloc>().add(
                                          UserEvent.addTag(
                                              tag: TagUser(
                                                  id: null,
                                                  name: tagController.text)));
                                      tagController.clear();
                                    }
                                  },
                                ),
                              ),
                              controller: tagController,
                            )
                          : const SizedBox.shrink(),
                    ],
                  )
                : const Text('Профиль пользователя не найден!')
            : const SizedBox.shrink();
      }
    });
  }
}
