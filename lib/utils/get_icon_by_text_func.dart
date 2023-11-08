import 'package:flutter/material.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';

Icon getIconByText(String text) {
  if (text == 'На обработке') {
    return const Icon(
      Icons.watch_later,
      color: Colors.orange,
    );
  } else if (text == 'Принята') {
    return const Icon(
      Icons.check,
      color: ColorsForWidget.colorGreen,
    );
  } else if (text == 'Отклонена') {
    return const Icon(
      Icons.block,
      color: Colors.red,
    );
  } else {
    return const Icon(
      Icons.question_mark,
      color: Colors.grey,
    );
  }
}
