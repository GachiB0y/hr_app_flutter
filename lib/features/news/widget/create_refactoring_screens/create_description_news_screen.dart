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
        return Scaffold(
          appBar: AppBarCreateRefactoringNewsScreens(
            id: cubit.state.currentNews!.id.toString(),
            reset: cubit.reset,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const HeaderTitle(title: 'Опиши мероприятие'),
                  const SizedBox(height: 30),
                  CreateNewsTextField(
                    maxLength: 1024,
                    maxLines: 15,
                    controller: cubit.textController,
                    hintText: 'Введи описание, не забудь указать место проведения',
                  ),
                  const SizedBox(height: 30),
                  ContinueButton(
                    isCreate: cubit.state.currentNews?.id == 0,
                    onTap: () {
                      if(cubit.isActive) {
                        context.octopus.setState(
                              (state) => state
                            ..findByName(Routes.createModerationScreensBucket.name)?.add(
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
          ),
        );
  }
}

