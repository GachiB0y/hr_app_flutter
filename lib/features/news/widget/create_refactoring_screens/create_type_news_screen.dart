import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_news_bloc.dart';
import 'package:octopus/octopus.dart';

class CreateTypeNewsScreen extends StatelessWidget {
  /// Экран массива новостей на модерации.
  const CreateTypeNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Bloc экрана.
    final cubit = context.watch<CreateRefactoringNewsCubit>();
   print (cubit.id);



    return BlocBuilder<CreateRefactoringNewsCubit, CreateRefactoringNewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const _AppBarForCreateNews(),
          body: Container()
        );
      },
    );
  }
}


class _AppBarForCreateNews extends StatelessWidget
    implements PreferredSizeWidget {
  const _AppBarForCreateNews();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
            onPressed: () {
              context.octopus
                  .setState((state) => state..removeByName('create-news'));
            },
            child: const Text('Сбросить'))
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}