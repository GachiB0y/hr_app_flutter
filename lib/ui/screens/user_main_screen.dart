import 'package:flutter/material.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/theme/style_text.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../../theme/colors_from_theme.dart';

class UserMainScreen extends StatelessWidget {
  const UserMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarFirstScreen(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).mainTexttt),
            TextField(),
          ],
        ),
      ),
    );
  }
}

class _AppBarFirstScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const _AppBarFirstScreen();

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: 16.0,
          ),
          child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: const Color.fromARGB(70, 255, 255, 255),
              borderRadius: BorderRadius.circular(17),
            ),
            child: MaterialButton(
              onPressed: () {},
              textColor: Colors.black,
              padding: const EdgeInsets.all(2),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.notifications_none,
              ),
            ),
          ),
        ),
      ],
      leading: const Avatar(),
      title: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Александр Волков', style: StyleTextCustom.textNameUser),
              Text('Менеджер по работе с клиентами',
                  style: StyleTextCustom.textJobUserGrey),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 16.0,
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFF2F2F2),
                  ),
                ),
                child: Image.asset(
                  'assets/images/man.png',
                  color: const Color(0xFFCCCCCC),
                  height: 34,
                  width: 34,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
                padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                decoration: BoxDecoration(
                  color: ColorsForWidget.colorRed,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '123',
                  style: StyleTextCustom.styleTextNotification,
                )),
          ),
        ),
      ],
    );
  }
}
