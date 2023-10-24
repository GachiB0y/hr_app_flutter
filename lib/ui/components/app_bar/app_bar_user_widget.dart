import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hr_app_flutter/domain/blocs/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/ui/components/app_bar/title_app_bar_widget.dart';

class AppBarUserWdiget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarUserWdiget({super.key});

  @override
  State<AppBarUserWdiget> createState() => _AppBarUserWdigetState();
  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _AppBarUserWdigetState extends State<AppBarUserWdiget> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      // shadowColor: Colors.transparent,
      toolbarHeight: 90,
      leadingWidth: 90,

      leading: const Avatar(),
      title: const TitleAppBarWidget(),
      backgroundColor: Colors.transparent,
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    final blocUser = context.watch<UserBloc>();
    double radius = MediaQuery.of(context).size.width / 8;

    return GestureDetector(
      onTap: () {
        context.pushRoute(ProfileWidgetRoute(
          userId: (blocUser.state as UserStateLoaded).userLoaded.autoCard,
          authRepository: blocUser.authRepository,
          userRepo: blocUser.userRepo,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: blocUser.state.when(loading: () {
          return const SizedBox.shrink();
        }, loaded: (user) {
          return CachedNetworkImage(
              imageUrl: user.avatar,
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  radius: radius,
                  backgroundImage: imageProvider,
                );
              });
        }, error: () {
          return const Text('Ошибка загрузки');
        }),
      ),
    );
  }
}
