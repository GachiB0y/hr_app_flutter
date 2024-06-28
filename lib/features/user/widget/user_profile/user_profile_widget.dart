import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/utils/extensions/string_extension.dart';
import 'package:hr_app_flutter/core/widget/components/shimmer/shimmer.dart';
import 'package:hr_app_flutter/features/auth/widget/auth_scope.dart';
import 'package:hr_app_flutter/features/settings/widget/settings_scope.dart';
import 'package:hr_app_flutter/features/user/bloc/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/features/user/widget/user_scope.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/user/user_info.dart';

class UserProfileWidgetScreen extends StatefulWidget {
  final String? userId;
  final String? isSelfUser;

  const UserProfileWidgetScreen({
    Key? key,
    required this.userId,
    this.isSelfUser = 'false',
  }) : super(key: key);

  @override
  State<UserProfileWidgetScreen> createState() =>
      _UserProfileWidgetScreenState();
}

class _UserProfileWidgetScreenState extends State<UserProfileWidgetScreen> {
  late final UserEntity user;

  @override
  void initState() {
    super.initState();
    if (widget.userId != null || widget.userId != '') {
      final blocUsers = context.read<UserBloc>();

      blocUsers.add(UserEvent.gethUserByUserId(userId: widget.userId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return UserScope(
      child: Shimmer(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Профиль',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            // actions: const [
            //   // SaveButtonWidget(),
            //   // ToggleThemeWidget(),
            //   // LogoutButtonWidget(),
            // ],
          ),
          body: SafeArea(
              child: UserInfoForm(
            isSelfUser: widget.isSelfUser,
          )),
        ),
      ),
    );
  }
}

/// {@template user_profile_widget}
/// ToggleThemeWidget widget.
/// {@endtemplate}
class ToggleThemeWidget extends StatelessWidget {
  /// {@macro user_profile_widget}
  const ToggleThemeWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state.data!.currentProfileUser == null) {
          return const SizedBox.shrink();
        } else {
          return state.data!.currentProfileUser!.self
              ? IconButton(
                  onPressed: () {
                    SettingsScope.of(context, listen: false).toggleThemeMode();
                  },
                  icon: Icon(
                      SettingsScope.of(context).theme.mode == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode),
                )
              : const SizedBox.shrink();
        }
      });
}

class UserInfoForm extends StatelessWidget {
  const UserInfoForm({super.key, required this.isSelfUser});

  final String? isSelfUser;

  /// Open app phone and dial number
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _sendEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserState$Processing) {
        return ShimmerUserProfileWidget(isSelfUser: isSelfUser);
      } else if (state is UserState$Idle || state is UserState$Successful) {
        if (state.data?.currentProfileUser == null) {
          return ShimmerUserProfileWidget(isSelfUser: isSelfUser);
        } else {
          String? phoneNumber = state.data!.currentProfileUser!.phoneOne;

          RegExp regExp = RegExp(r'^(\d{1})(\d{3})(\d{3})(\d{2})(\d{2})$');
          String? formattedNumber = phoneNumber?.replaceAllMapped(regExp,
              (Match m) => '+ ${m[1]}(${m[2]}) ${m[3]}-${m[4]}-${m[5]}');

          /// Преобразование даты рождения пользователя.
          var day = state.data!.currentProfileUser?.dateBirth != null
              ? DateFormat('yMMMMd')
                  .format(
                    state.data!.currentProfileUser!.dateBirth!
                        .convertToDateTime(),
                  )
                  .replaceAll('г.', '')
              : '';

          return Column(
            children: [
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const AvatarProfileWidget(),
                              const SizedBox(height: 16),
                              Text(
                                state.data!.currentProfileUser!.staffPosition,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                softWrap: true,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '${state.data!.currentProfileUser!.nameI} ${state.data!.currentProfileUser!.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 30),
                                softWrap: true,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonTextWidget(
                                    title:
                                        '${state.data!.currentProfileUser!.email}',
                                    onPressed: () =>
                                        state.data?.currentProfileUser?.email !=
                                                null
                                            ? _sendEmail(state.data!
                                                .currentProfileUser!.email!)
                                            : null,
                                  ),
                                  const SizedBox(width: 8),
                                  ButtonTextWidget(
                                    title: formattedNumber,
                                    onPressed: () => formattedNumber != null
                                        ? _makePhoneCall(formattedNumber)
                                        : null,
                                  ),
                                ],
                              ),
                              Text(
                                day,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 14,
                                        color: const Color(0xFF7B7D84)),
                              ),
                              const SizedBox(height: 25),
                              const TagsWidget(),
                              const SizedBox(height: 25),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SaveButtonWidget(),
              const SizedBox(height: 25),
              LogoutButtonWidget(
                isSelfuser: isSelfUser,
              ),
              const SizedBox(height: 25),
            ],
          );
        }
      } else {
        return const Center(child: Text('Пользователь не найден.'));
      }
    });
  }
}

/// Button for click email and phone number
class ButtonTextWidget extends StatelessWidget {
  const ButtonTextWidget({super.key, this.onPressed, required this.title});
  final void Function()? onPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: onPressed,
      child: Text(
        title ?? '',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 14,
              color: const Color(0xFF7B7D84),
            ),
      ),
    );
  }
}

class ShimmerUserProfileWidget extends StatelessWidget {
  const ShimmerUserProfileWidget({
    super.key,
    required this.isSelfUser,
  });

  final String? isSelfUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: ShimmerBodyContentWidget(),
        ),
        const SizedBox(
          height: 20,
        ),
        LogoutButtonWidget(
          isSelfuser: isSelfUser,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class ShimmerBodyContentWidget extends StatelessWidget {
  const ShimmerBodyContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 205,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const ClipOval(),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key, required this.isSelfuser});

  final String? isSelfuser;

  @override
  Widget build(BuildContext context) {
    if (UserScope.of(context).state.isSave == true) {
      return const SizedBox.shrink();
    } else {
      return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return isSelfuser == 'true'
            ? Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    AuthScope.of(context, listen: false).signOut();
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(3.0),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return const Color.fromARGB(255, 255, 255, 255);
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 57)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                  ),
                  child: Text('Выйти из аккаунта',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 24, fontWeight: FontWeight.w500)),
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
    double radius = 102.5; //MediaQuery.of(context).size.width / 4;

    final viewModel = UserScope.of(context);

    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserState$Successful || state is UserState$Idle) {
        return state.data == null
            ? const SizedBox.shrink()
            : state.data!.currentProfileUser == null
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Stack(
                      children: [
                        ///Нужен для того,чтобы иконка не улетала при загрузке автара
                        SizedBox(
                          width: radius * 2,
                          child: CachedNetworkImage(
                              imageUrl: state.data!.currentProfileUser!.avatar,
                              imageBuilder: (context, imageProvider) {
                                return CircleAvatar(
                                  radius: radius,
                                  backgroundImage:
                                      viewModel.state.myImage.imageFile != null
                                          ? FileImage(viewModel
                                              .state.myImage.imageFile as File)
                                          : imageProvider,
                                );
                              }),
                        ),
                        state.data!.currentProfileUser!.self
                            ? Positioned(
                                top: 0,
                                right: 0,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 8.0,
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    icon:
                                        const Icon(Icons.add_a_photo_outlined),
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
                                                  newValue: true,
                                                  isTags: false);
                                        }
                                      }
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
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
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: ElevatedButton(
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
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(3.0),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                return const Color.fromARGB(46, 94, 222, 102);
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            minimumSize:
                MaterialStateProperty.all(const Size(double.infinity, 57)),
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Theme.of(context).colorScheme.primary),
          ),
          child: Text('Сохранить',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w500)),
        ),
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
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  label: Text(
                                    '#${tag.name}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  onDeleted: state
                                          .data!.currentProfileUser!.editTags
                                      ? () {
                                          UserScope.of(context, listen: false)
                                              .state
                                              .changeIsSave(
                                                  newValue: true, isTags: true);
                                          context.read<UserBloc>().add(
                                              UserEvent.deleteTag(tag: tag));
                                        }
                                      : null,
                                  deleteIcon:
                                      state.data!.currentProfileUser!.editTags
                                          ? const Icon(
                                              Icons.close,
                                              size: 20,
                                            )
                                          : null,
                                  deleteButtonTooltipMessage: 'Удалить',
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
