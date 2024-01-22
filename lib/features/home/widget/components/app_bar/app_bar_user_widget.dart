import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/core/widget/components/shimmer/shimmer.dart';
import 'package:hr_app_flutter/features/home/widget/components/app_bar/title_app_bar_widget.dart';
import 'package:octopus/octopus.dart';
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
        return GestureDetector(
          onTap: () {
            String id = '';
            if (state.data != null) {
              id = state.data!.authUser.autoCard.toString();
            }
            Octopus.of(context).setState((stateRoute) => stateRoute
              ..add(Routes.profileUser.node(
                arguments: <String, String>{
                  'id': id,
                },
              )));
          },
          child: (state.data == null ||
                  state is UserState$Processing ||
                  state is UserState$Error)
              ? ShimmerLoading(
                  isLoading: true,
                  child: Container(
                    width: radius,
                    height: radius,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const ClipOval(),
                  ),
                )
              : Padding(
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
      },
    );
  }
}
