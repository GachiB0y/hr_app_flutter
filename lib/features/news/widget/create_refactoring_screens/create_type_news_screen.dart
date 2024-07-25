import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/home/widget/home_scope.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_type_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/AppBarCreateRefactoringScreens.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/continue_button.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/header_title.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/type_news_card.dart';
import 'package:octopus/octopus.dart';

class CreateTypeNewsScreen extends StatelessWidget {
  /// Экран выбора категории новости при создании или модерации.
  const CreateTypeNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Bloc экрана.
    final cubit = context.read<CreateRefactoringTypeNewsCubit>();

    return Scaffold(
      appBar: AppBarCreateRefactoringNewsScreens(
        id: cubit.state.currentNews.id.toString(),
        reset: () {
          cubit.reset(
            cubit.state.currentNews.id.toString(),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const HeaderTitle(title: 'Выберите тип события'),
            const SizedBox(height: 30),
            BlocBuilder<CreateRefactoringTypeNewsCubit, CreateRefactoringTypeNewsState>(
              builder: (context, state) => Wrap(
                spacing: 14.0, // Расстояние между Chips
                runSpacing: 14.0, // Расстояние между строками Chips
                children: state.categoriesNews.isNotEmpty
                    ? state.categoriesNews
                        .map(
                          (item) => TypeNewsCard(
                            onTap: () => cubit.selectCategory(item.id),
                            title: item.name,
                            isSelected: cubit.checkTypes(item.id),
                          ),
                        )
                        .toList()
                    : [],
              ),
            ),
            const Spacer(),
            BlocBuilder<CreateRefactoringTypeNewsCubit, CreateRefactoringTypeNewsState>(
              builder: (context, state) => ContinueButton(
                isCreate: cubit.state.currentNews.id == 0,
                onTap: () {
                  HomeScope.of(context).state.onItemTapped(4);

                  if (cubit.state.currentNews.categories != null &&
                      cubit.state.currentNews.categories!.isNotEmpty) {
                    context.octopus.setState(
                      (state) => state
                        ..findByName(Routes.createModerationScreensBucket.name)?.add(
                          Routes.createDateNewsScreen.node(),
                        ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
