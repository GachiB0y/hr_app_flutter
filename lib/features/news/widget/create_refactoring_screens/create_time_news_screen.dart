import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_time_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/AppBarCreateRefactoringScreens.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/continue_button.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/header_title.dart';
import 'package:octopus/octopus.dart';

class CreateTimeNewsScreen extends StatelessWidget {
  /// Экран выбора времени на модерации.
  const CreateTimeNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateRefactoringTimeNewsCubit>();
    return BlocBuilder<CreateRefactoringTimeNewsCubit, CreateRefactoringTimeNewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarCreateRefactoringNewsScreens(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const HeaderTitle(title: 'Выберите время проведения'),
                const SizedBox(height: 30),
                CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  onTimerDurationChanged: (Duration value) {
                   cubit.changeTime(value);
                  },
                ),
                const Spacer(),
                ContinueButton(
                  onTap: () {
                    context.octopus.setState(
                          (state) => state
                        ..findByName('user-main-tab')?.add(
                          Routes.createTitleNewsScreen.node(),
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