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
    final blocUser = context.watch<UserBloc>();
    return Row(
      children: [
        blocUser.state.when(
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (userLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${'${userLoaded.name} ${userLoaded.nameI}'} ',
                    softWrap: true, style: StyleTextCustom.textNameUser),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                      text: userLoaded.staffPosition,
                      style: StyleTextCustom.textJobUserGrey),
                ),
              ],
            );
          },
          error: () => const Text('Nothing found...'),
        ),
      ],
    );
  }
}
