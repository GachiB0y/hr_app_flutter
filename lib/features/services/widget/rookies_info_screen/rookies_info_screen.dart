import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/components/database/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:intl/intl.dart';

import '../../bloc/rookies_bloc/rookies_bloc.dart';
import '../../bloc/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';
import '../service_screen.dart/bottom_sheet_create_events_model.dart';

@RoutePage()
class RookiesInfoScreen extends StatelessWidget implements AutoRouteWrapper {
  RookiesInfoScreen({
    super.key,
  });

  final BottomSheetCreateEventsModel _model = BottomSheetCreateEventsModel();
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<RookiesBLoC>(
      create: (BuildContext context) => RookiesBLoC(
        authRepository: DependenciesScope.of(context).authRepository,
        userRepo: DependenciesScope.of(context).userRepository,
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Row(
          children: [
            Text(
              'Новые соотрудники',
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
          child: ChangeNotifierProvaider<BottomSheetCreateEventsModel>(
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

  @override
  void initState() {
    super.initState();

    context.read<RookiesBLoC>().add(const RookiesEvent.fetch());

    final DateTime dateNow = DateTime.now();
    final DateTime delayedDate = dateNow.add(const Duration(days: -7));
    final String formattedDateDelayed =
        DateFormat('dd MMMM', 'ru').format(delayedDate);
    final String formattedDateNow = DateFormat('dd MMMM', 'ru').format(dateNow);
    dateRangeController.text = '$formattedDateDelayed - $formattedDateNow ';
  }

  @override
  Widget build(BuildContext context) {
    double raduis = 30.0;

    return BlocBuilder<RookiesBLoC, RookiesState>(
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
                            itemCount: state.data!.rookies.length,
                            itemBuilder: (context, index) {
                              String joinDate =
                                  state.data!.rookies[index].joinDate;
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: RichText(
                                    text: TextSpan(
                                        text:
                                            '${joinDate.substring(0, joinDate.length - 5).replaceAll("-", ".")}  - ',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                        children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '${state.data!.rookies[index].name} ${state.data!.rookies[index].nameI}\n',
                                      ),
                                      TextSpan(
                                          text:
                                              '(${state.data!.rookies[index].staffPosition})',
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

class DatePickerRangeWidget extends StatelessWidget {
  const DatePickerRangeWidget(
      {super.key, required this.raduis, required this.dateRangeController});

  final double raduis;
  final TextEditingController dateRangeController;

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
                    ChangeNotifierProvaider<BottomSheetCreateEventsModel>,
                    BottomSheetCreateEventsModel>(context);
                await ChangeNotifierProvaider.watch<
                        ChangeNotifierProvaider<BottomSheetCreateEventsModel>,
                        BottomSheetCreateEventsModel>(context)
                    ?.selectDateRange(
                        context: context,
                        dateRangeController: dateRangeController);
                if (!context.mounted) return;
                context.read<RookiesBLoC>().add(RookiesEvent.fetch(
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
