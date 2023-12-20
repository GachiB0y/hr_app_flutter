import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user/bloc/user_bloc/user_bloc.dart';

class TitleAppBarWidget extends StatefulWidget {
  const TitleAppBarWidget({
    super.key,
  });

  @override
  State<TitleAppBarWidget> createState() => _TitleAppBarWidgetState();
}

class _TitleAppBarWidgetState extends State<TitleAppBarWidget> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        if (state is UserState$Processing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserState$Error) {
          return const Text('Ошибка загрузки');
        } else {
          if (state.data == null) {
            return const SizedBox.shrink();
          } else {
            return Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        '${'${state.data?.authUser.name} ${state.data?.authUser.nameI}'} ',
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        softWrap: true,
                        maxLines: 2,
                        state.data!.authUser.staffPosition,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.outline),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        }
      },
    );
  }
}
