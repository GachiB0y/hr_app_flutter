import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_date_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/AppBarCreateRefactoringScreens.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/continue_button.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/header_title.dart';
import 'package:octopus/octopus.dart';

class CreateDateNewsScreen extends StatelessWidget {
  /// Экран выбора даты при создании или модерации новости.
  const CreateDateNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateRefactoringDateNewsCubit>();
    return BlocBuilder<CreateRefactoringDateNewsCubit, CreateRefactoringDateNewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarCreateRefactoringNewsScreens(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const HeaderTitle(title: 'Выберите дату мероприятия'),
                const SizedBox(height: 30),
                CalendarDatePicker(
                    initialDate: state.currentNews?.startDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: (DateTime value) {
                      cubit.changeDate(value);
                    }),
                const Spacer(),
                ContinueButton(
                  onTap: () {
                    if (state.currentNews?.startDate != null) {
                      context.octopus.setState(
                        (state) => state
                          ..findByName('user-main-tab')?.add(
                            Routes.createTimeNewsScreen.node(),
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
