import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/loader_cubit/loader_view_cubit.dart';
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
    final loaderViewCubit = context.watch<LoaderViewCubit>();

    return AppBar(
      scrolledUnderElevation: 0.0,
      // shadowColor: Colors.transparent,
      toolbarHeight: 90,
      leadingWidth: 90,
      actions: <Widget>[
        Padding(
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
                await loaderViewCubit.logout();

                AutoRouter.of(context).replace(const AuthenticationFormRoute());
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
        ),
      ],
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
          return CircleAvatar(
            radius: radius,
            backgroundImage: Image.network(user.avatar).image,
          );
        }, error: () {
          return const Text('Ошибка загрузки');
        }),
      ),
    );
  }
}
