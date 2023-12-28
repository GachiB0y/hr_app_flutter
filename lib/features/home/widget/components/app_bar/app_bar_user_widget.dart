import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/features/home/widget/components/app_bar/title_app_bar_widget.dart';

import '../../../../user/bloc/user_bloc/user_bloc.dart';

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
    double radius = MediaQuery.of(context).size.width / 8;

    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, state) {
        if (state.data == null) {
          return const SizedBox.shrink();
        } else if (state is UserState$Error) {
          return const Text('Ошибка загрузки');
        } else {
          return GestureDetector(
            onTap: () {
              context.pushRoute(ProfileWidgetRoute(
                userId: state.data!.authUser.autoCard,
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CachedNetworkImage(
                  imageUrl: state.data!.authUser.avatar,
                  imageBuilder: (context, imageProvider) {
                    return CircleAvatar(
                      radius: radius,
                      backgroundImage: imageProvider,
                    );
                  }),
            ),
          );
        }
      },
    );
  }
}
