import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_description_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/AppBarCreateRefactoringScreens.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/continue_button.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/header_title.dart';
import 'package:octopus/octopus.dart';

import 'widgets/create_news_text_field.dart';

class CreateDescriptionNewsScreen extends StatelessWidget {
  /// Экран описания новости при создании или модерации.
  const CreateDescriptionNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateRefactoringDescriptionNewsCubit>();
    return BlocBuilder<CreateRefactoringDescriptionNewsCubit, CreateRefactoringDescriptionNewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarCreateRefactoringNewsScreens(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const HeaderTitle(title: 'Опиши мероприятие'),
                const SizedBox(height: 30),
                CreateNewsTextField(
                  controller: cubit.textController,
                  hintText: 'Введи описание, не забудь указать место проведения',
                ),
                const Spacer(),
                ContinueButton(
                  onTap: () {
                    if(state.currentNews?.description != null && state.currentNews!.description!.isNotEmpty) {
                      context.octopus.setState(
                      (state) => state
                        ..findByName('user-main-tab')?.add(
                          Routes.createPhotoNewsScreen.node(),
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
      },
    );
  }
}

