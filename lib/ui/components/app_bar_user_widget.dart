import 'package:flutter/material.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';
import 'package:hr_app_flutter/theme/style_text.dart';

class AppBarUserWdiget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarUserWdiget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      // shadowColor: Colors.transparent,
      toolbarHeight: 100,
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
              onPressed: () {},
              textColor: Colors.black,
              padding: const EdgeInsets.all(2),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.notifications_none,
                size: 35,
              ),
            ),
          ),
        ),
      ],
      leading: const Avatar(),
      title: const Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Александр Волков', style: StyleTextCustom.textNameUser),
              SizedBox(
                height: 5,
              ),
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
      ),
    );
  }
}
