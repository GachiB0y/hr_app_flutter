import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/create_type_news_screen.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/continue_button.dart';
import 'package:octopus/octopus.dart';

class CreateDateNewsScreen extends StatelessWidget {
  /// Экран массива новостей на модерации.
  const CreateDateNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateRefactoringNewsCubit>();
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
                CalendarDatePicker(
                    initialDate: cubit.state.currentNews.startDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: (DateTime value) {}),
                const Spacer(),
                ContinueButton(
                  onTap: () {
                    context.octopus.setState(
                      (state) => state
                        ..findByName('user-main-tab')?.add(
                          Routes.createTypeNewsScreen.node(),
                        ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
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
