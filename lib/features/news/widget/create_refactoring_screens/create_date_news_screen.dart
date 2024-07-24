import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/core/utils/extensions/string_extension.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_date_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/AppBarCreateRefactoringScreens.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/continue_button.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/header_title.dart';
import 'package:intl/intl.dart';
import 'package:octopus/octopus.dart';

class CreateDateNewsScreen extends StatelessWidget {
  /// Экран выбора даты при создании или модерации новости.
  const CreateDateNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateRefactoringDateNewsCubit>();

    return Scaffold(
      appBar: const AppBarCreateRefactoringNewsScreens(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const HeaderTitle(title: 'Выберите дату мероприятия'),
            const SizedBox(height: 30),
            CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                disableModePicker: true,
                lastMonthIcon: const Icon(
                  Icons.chevron_left,
                  color: Colors.green,
                  size: 30,
                ),
                nextMonthIcon: const Icon(
                  Icons.chevron_right,
                  color: Colors.green,
                  size: 30,
                ),
                dayTextStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                controlsTextStyle:
                    const TextStyle(color: Colors.green, fontSize: 25),
                weekdayLabels: ['ВС', 'ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ'],
                modePickerTextHandler: ({required monthDate, isMonthPicker}) {
                  if (isMonthPicker ?? false) {
                    return DateFormat('MMMM').format(monthDate).capitalize();
                  }
                  return null;
                },
                hideScrollViewMonthWeekHeader: false,
                centerAlignModePicker: true,
                calendarType: CalendarDatePicker2Type.range,
                rangeBidirectional: false,
                currentDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2026),
              ),
              value: [
                cubit.state.currentNews?.startDate,
                cubit.state.currentNews?.endDate,
              ],
              onValueChanged: cubit.changeDate,
            ),
            const Spacer(),
            ContinueButton(
              isCreate: cubit.state.currentNews?.id == 0,
              onTap: () {
                if (cubit.isActive) {
                  context.octopus.setState(
                    (state) => state
                      ..findByName(Routes.createModerationScreens.name)?.add(
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
  }
}
