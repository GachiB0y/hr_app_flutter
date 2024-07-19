import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/home/widget/components/app_bar/title_app_bar_widget.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/notification/bloc/count_notification_bloc/count_notification_bloc.dart';
import 'package:hr_app_flutter/features/user/bloc/user_bloc/user_bloc.dart';
import 'package:hr_app_flutter/ui/commons/app_octo_image.dart';
import 'package:hr_app_flutter/ui/commons/widget/components/shimmer/shimmer.dart';
import 'package:octopus/octopus.dart';

class AppBarUserWdiget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarUserWdiget({super.key});

  @override
  State<AppBarUserWdiget> createState() => _AppBarUserWdigetState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _AppBarUserWdigetState extends State<AppBarUserWdiget> {
  late final CountNotificationBLoC _countNotificationBLoC;
  @override
  void initState() {
    super.initState();
    _countNotificationBLoC = CountNotificationBLoC(
      repository: DependenciesScope.of(context).notificationRepository,
    )..add(const CountNotificationEvent.fetch());
    context.read<UserBloc>().add(const UserEvent.fetch());
  }

  @override
  Widget build(BuildContext context) => AppBar(
        scrolledUnderElevation: 0.0,
        toolbarHeight: 90,
        leadingWidth: 70,
        leading: const Avatar(),
        title: const TitleAppBarWidget(),
        actions: [
          Badge(
            backgroundColor: Theme.of(context).colorScheme.primary,
            alignment: AlignmentDirectional.bottomStart,
            label: BlocBuilder<CountNotificationBLoC, CountNotificationState>(
              bloc: _countNotificationBLoC,
              builder: (context, state) =>
                  state.mapOrNull(
                    idle: (state) =>
                        Text(state.data == null ? '0' : state.data.toString()),
                  ) ??
                  const Text('0'),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                size: 33,
              ),
              onPressed: () {
                context.octopus.setState(
                  (state) => state
                    ..findByName('user-main-tab')?.add(
                      Routes.notificaion.node(),
                    ),
                );
              },
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
      );
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    final radius = MediaQuery.of(context).size.width / 8;

    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, state) => GestureDetector(
          onTap: () {
            String id = '';
            if (state.data != null) {
              id = state.data!.authUser.autoCard.toString();
            }
            context.octopus.setState(
              (state) => state
                ..findByName('user-main-tab')?.add(
                  Routes.profileUser.node(
                    arguments: <String, String>{
                      'id': id,
                      'isSelfUser': 'true',
                    },
                  ),
                ),
            );
          },
          child: (state.data == null || state is UserState$Processing || state is UserState$Error)
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
              : Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: AppOctoImage(
                    isProgressIndicator: false,
                    urlImage: state.data!.authUser.avatar,
                  ),
                ),
        ),
    );
  }
}
