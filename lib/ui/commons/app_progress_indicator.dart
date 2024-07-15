import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  /// Анимация загрузки
  const AppProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 50,
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
