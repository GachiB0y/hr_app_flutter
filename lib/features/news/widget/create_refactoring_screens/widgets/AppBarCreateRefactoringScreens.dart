import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';

class AppBarCreateRefactoringNewsScreens extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCreateRefactoringNewsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
            onPressed: () {
              context.octopus.setState((state) => state..removeByName('create-news'));
            },
            child: const Text('Сбросить'))
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}