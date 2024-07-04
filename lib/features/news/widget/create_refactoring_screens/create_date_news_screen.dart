import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/continue_button.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/type_news_card.dart';
import 'package:octopus/octopus.dart';

class CreateDateNewsScreen extends StatelessWidget {
  /// Экран массива новостей на модерации.
  const CreateDateNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Bloc экрана.
    final cubit = context.read<CreateRefactoringNewsCubit>();
    final categoriesNews = context.select((CreateRefactoringNewsCubit value) => value.state.categoriesNews);

    return BlocBuilder<CreateRefactoringNewsCubit, CreateRefactoringNewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const _AppBarForCreateNews(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const HeaderTitle(title: 'Выберите дату мероприятия'),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 14.0, // Расстояние между Chips
                  runSpacing: 14.0, // Расстояние между строками Chips
                  children: categoriesNews.isNotEmpty
                      ? categoriesNews
                      .map((item) => TypeNewsCard(
                    onTap: () => cubit.selectCategory(item.id),
                    title: item.name,
                    isSelected: cubit.checkTypes(item.id),
                  ))
                      .toList()
                      : [],
                ),
                const Spacer(),
                ContinueButton(onTap: (){
                  context.octopus.setState(
                        (state) => state
                      ..findByName('user-main-tab')?.add(
                        Routes.createTypeNewsScreen.node(),
                      ),
                  );
                },),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HeaderTitle extends StatelessWidget {
  final String title;
  const HeaderTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
    );
  }
}

class _AppBarForCreateNews extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarForCreateNews();

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