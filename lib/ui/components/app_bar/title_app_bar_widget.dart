import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/user_bloc/user_bloc.dart';

import 'package:hr_app_flutter/theme/style_text.dart';

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
                          '${'${state.data?.name} ${state.data?.nameI}'} ',
                          softWrap: true,
                          maxLines: 2,
                          style: StyleTextCustom.textNameUser),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                          softWrap: true,
                          maxLines: 2,
                          state.data!.staffPosition,
                          style: StyleTextCustom.textJobUserGrey),
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
