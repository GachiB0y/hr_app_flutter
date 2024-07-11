import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:octopus/octopus.dart';

class AppBarCreateRefactoringNewsScreens extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCreateRefactoringNewsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
            onPressed: () {
              context.octopus
                  .setState((state) => state..removeByName(Routes.createModerationScreens.name));
            },
            child: const Text('Сбросить'))
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
