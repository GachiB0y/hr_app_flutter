import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/components/database/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/news/widget/create_news_screen/create_events_view_model.dart';
import 'package:intl/intl.dart';

import '../../bloc/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';

class BirthDayInfoScreen extends StatelessWidget {
  BirthDayInfoScreen({
    super.key,
  });

  final CreateEventsViewModel _model = CreateEventsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        actions: const [
          InfoActionWidget(),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Row(
          children: [
            Text(
              'Именники',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: ChangeNotifierProvaider<CreateEventsViewModel>(
              model: _model, child: const ListInfoBirthDay()),
        ),
      ),
    );
  }
}

class ListInfoBirthDay extends StatefulWidget {
  const ListInfoBirthDay({super.key});

  @override
  State<ListInfoBirthDay> createState() => _ListInfoBirthDayState();
}

class _ListInfoBirthDayState extends State<ListInfoBirthDay> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController dateRangeController = TextEditingController();
  late final UserBirthDayInfoBLoc userBirthDayInfoBLoc;
  @override
  void initState() {
    super.initState();

    userBirthDayInfoBLoc = UserBirthDayInfoBLoc(
      userRepo: DependenciesScope.of(context).userRepository,
    );

    userBirthDayInfoBLoc.add(const UserBirthDayInfoEvent.fetch());

    final DateTime dateNow = DateTime.now();
    final DateTime delayedDate = dateNow.add(const Duration(days: 7));
    final String formattedDateDelayed =
        DateFormat('dd MMMM', 'ru').format(delayedDate);
    final String formattedDateNow = DateFormat('dd MMMM', 'ru').format(dateNow);
    dateRangeController.text = '$formattedDateNow - $formattedDateDelayed';
  }

  @override
  void dispose() {
    userBirthDayInfoBLoc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double raduis = 30.0;

    return BlocBuilder<UserBirthDayInfoBLoc, UserBirthDayInfoState>(
      bloc: userBirthDayInfoBLoc,
      builder: (context, state) {
        if (state is UserBirthDayInfoState$Processing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return state.data == null
              ? const Center(child: Text('Ничего не найденно'))
              : Column(
                  children: [
                    DatePickerRangeWidget(
                      dateRangeController: dateRangeController,
                      raduis: raduis,
                      userBirthDayInfoBLoc: userBirthDayInfoBLoc,
                    ),
                    if (state is UserBirthDayInfoState$Error)
                      Container(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(raduis),
                          color: Colors.white,
                        ),
                        child: const Text('Ошибка загрузки данных.'),
                      ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(raduis),
                          color: Colors.white,
                        ),
                        child: Scrollbar(
                          controller: _scrollController,
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: state.data!.birthdays.length,
                            itemBuilder: (context, index) {
                              String dateBirthDay =
                                  state.data!.birthdays[index].dateBirth;
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: RichText(
                                    text: TextSpan(
                                        text:
                                            '${dateBirthDay.substring(0, dateBirthDay.length - 5).replaceAll("-", ".")}  - ',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                        children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '${state.data!.birthdays[index].name} ${state.data!.birthdays[index].nameI}\n',
                                      ),
                                      TextSpan(
                                          text:
                                              '(${state.data!.birthdays[index].staffPosition ?? 'Не найденно'})',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal)),
                                    ])),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        }
      },
    );
  }
}

class InfoActionWidget extends StatelessWidget {
  const InfoActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Tooltip(
          message: 'Ваши 3 коина за др ждут вас в отделе HR',
          child: Icon(
            Icons.question_mark,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class DatePickerRangeWidget extends StatelessWidget {
  const DatePickerRangeWidget(
      {super.key,
      required this.raduis,
      required this.dateRangeController,
      required this.userBirthDayInfoBLoc});

  final double raduis;
  final TextEditingController dateRangeController;
  final UserBirthDayInfoBLoc userBirthDayInfoBLoc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: Colors.white,
      ),
      child: Row(
        children: [
          GestureDetector(
              onTap: () async {
                final model = ChangeNotifierProvaider.watch<
                    ChangeNotifierProvaider<CreateEventsViewModel>,
                    CreateEventsViewModel>(context);
                await ChangeNotifierProvaider.watch<
                        ChangeNotifierProvaider<CreateEventsViewModel>,
                        CreateEventsViewModel>(context)
                    ?.selectDateRange(
                        context: context,
                        dateRangeController: dateRangeController);
                if (!context.mounted) return;
                userBirthDayInfoBLoc.add(UserBirthDayInfoEvent.fetch(
                    startDate: model?.startDate, endDate: model?.endDate));
              },
              child: const Icon(Icons.calendar_today)),
          const SizedBox(width: 10),
          Text(
            dateRangeController.text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
