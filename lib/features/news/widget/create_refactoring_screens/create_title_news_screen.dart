import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_title_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/AppBarCreateRefactoringScreens.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/continue_button.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/header_title.dart';
import 'package:octopus/octopus.dart';

import 'widgets/create_news_text_field.dart';

class CreateTitleNewsScreen extends StatelessWidget {
  /// Экран написания заголовка новости при создании или модерации.
  const CreateTitleNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateRefactoringTitleNewsCubit>();
    return Scaffold(
          appBar: const AppBarCreateRefactoringNewsScreens(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const HeaderTitle(title: 'Напиши заголовок'),
                const SizedBox(height: 30),
                CreateNewsTextField(
                  controller: cubit.textController,
                  hintText: 'Введи заголовок',
                ),
                const Spacer(),
                ContinueButton(
                  isCreate: cubit.state.currentNews?.id == 0,
                  onTap: () {
                    if (cubit.isActive) {
                      context.octopus.setState(
                        (state) => state
                          ..findByName(Routes.createModerationScreens.name)?.add(
                            Routes.createDescriptionNewsScreen.node(),
                          ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
  }
}
