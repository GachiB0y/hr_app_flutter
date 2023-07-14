import 'package:flutter/material.dart';
import 'package:hr_app_flutter/generated/l10n.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';
import 'package:hr_app_flutter/theme/style_text.dart';

class TabBarWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangeTab;
  const TabBarWidget(
      {super.key, required this.index, required this.onChangeTab});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  final int number = 6;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 74,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildItem(
              index: 0,
              img: Image.asset(
                'assets/images/menu_icon_grey.png',
                width: 30,
                height: 30,
              ),
              text: S.of(context).tabBarText_main),
          buildItem(
              index: 1,
              img: Image.asset(
                'assets/images/rub_icon.png',
                width: 30,
                height: 30,
              ),
              text: S.of(context).tabBarText_grassCoin),
          Stack(
            alignment: Alignment.topRight,
            children: [
              buildItem(
                  index: 2,
                  img: Image.asset(
                    'assets/images/grass_icon_main.png',
                    width: 30,
                    height: 30,
                  ),
                  text: S.of(context).tabBarText_company),
              Padding(
                padding: number < 10
                    ? const EdgeInsets.only(right: 8.0)
                    : EdgeInsets.zero,
                child: Container(
                    padding: const EdgeInsets.only(
                      left: 3.0,
                      right: 3.0,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsForWidget.colorRed,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      number.toString(),
                      style: StyleTextCustom.styleTextNotification,
                    )),
              ),
            ],
          ),
          buildItem(
              index: 3,
              img: Image.asset(
                'assets/images/book_icon.png',
                width: 30,
                height: 30,
              ),
              text: S.of(context).tabBarText_education),
          buildItem(
              index: 4,
              img: Image.asset(
                'assets/images/service_icon.png',
                width: 30,
                height: 30,
              ),
              text: S.of(context).tabBarText_service),
        ],
      ),
    );
  }

  Widget buildItem({
    required int index,
    required String text,
    Icon? icon,
    required Image img,
  }) {
    final isSelected = index == widget.index;
    return GestureDetector(
      onTap: () => widget.onChangeTab(index),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
            isSelected ? ColorsForWidget.colorGreen : Colors.black,
            BlendMode.srcATop),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            img,
            Text(
              text,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
