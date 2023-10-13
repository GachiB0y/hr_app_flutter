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
    // TODO: implement initState
    super.initState();
    context.read<UserBloc>().add(const UserEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    final loaderViewCubit = context.watch<LoaderViewCubit>();
    final blocUser = context.watch<UserBloc>();

    return AppBar(
      scrolledUnderElevation: 0.0,
      // shadowColor: Colors.transparent,
      toolbarHeight: 90,
      leadingWidth: 85,
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
      leading: GestureDetector(
          onTap: () {
            context.pushRoute(ProfileWidgetRoute(
                user: (blocUser.state as UserStateLoaded).userLoaded));
          },
          child: const Avatar()),
      title: const TitleAppBarWidget(),
      backgroundColor: Colors.transparent,
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 128, 124, 124),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 128, 124, 124),
                  ),
                ),
                child: Image.asset(
                  'assets/images/man.png',
                  color: const Color.fromARGB(255, 0, 0, 0),
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20.0),
          //   child: Align(
          //     alignment: Alignment.topRight,
          //     child: Container(
          //         padding: const EdgeInsets.only(left: 3.0, right: 3.0),
          //         decoration: BoxDecoration(
          //           color: ColorsForWidget.colorRed,
          //           borderRadius: BorderRadius.circular(12),
          //         ),
          //         child: const Text(
          //           '123',
          //           style: StyleTextCustom.styleTextNotification,
          //         )),
          //   ),
          // ),
        ],
      ),
    );
  }
}
