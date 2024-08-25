import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final String title;

  /// Виджет заголовка на экранах создания и модерации новости.
  const HeaderTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
      textAlign: TextAlign.center,
    );
  }
}