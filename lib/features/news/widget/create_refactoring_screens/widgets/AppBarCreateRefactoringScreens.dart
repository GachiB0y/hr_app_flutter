import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:octopus/octopus.dart';

class AppBarCreateRefactoringNewsScreens extends StatelessWidget implements PreferredSizeWidget {
  final String id;
  final VoidCallback reset;

  const AppBarCreateRefactoringNewsScreens({
    required this.reset,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (id != '0') {
                reset();
              }
              context.octopus
                  .setState((state) => state..removeByName(Routes.createModerationScreensBucket.name));
            },
            child: const Text('Сбросить'),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
