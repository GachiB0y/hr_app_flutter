import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';
import 'package:intl/intl.dart';

import '../../../auth/data/repo/auth_repository.dart';
import '../../../user/data/repo/user_repository.dart';
import '../../../../library/custom_provider/inherit_widget.dart';
import '../../bloc/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';
import '../service_screen.dart/bottom_sheet_create_events_model.dart';

@RoutePage()
class BirthDayInfoScreen extends StatelessWidget implements AutoRouteWrapper {
  BirthDayInfoScreen(
      {super.key, required this.authRepository, required this.userRepo});
  final IAuthRepository authRepository;
  final IUserRepository userRepo;
  final BottomSheetCreateEventsModel _model = BottomSheetCreateEventsModel();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<UserBirthDayInfoBLoc>(
      create: (BuildContext context) => UserBirthDayInfoBLoc(
        authRepository: authRepository,
        userRepo: userRepo,
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsForWidget.colorGreen,
      appBar: AppBar(
        actions: const [
          InfoActionWidget(),
        ],
        backgroundColor: ColorsForWidget.colorGreen,
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
    context
        .read<UserBirthDayInfoBLoc>()
        .add(const UserBirthDayInfoEvent.fetch());

    final DateTime dateNow = DateTime.now();
    final DateTime delayedDate = dateNow.add(const Duration(days: 7));
    final String formattedDateDelayed =
        DateFormat('dd MMMM', 'ru').format(delayedDate);
    final String formattedDateNow = DateFormat('dd MMMM', 'ru').format(dateNow);
    dateRangeController.text = '$formattedDateNow - $formattedDateDelayed';
  }

  @override
  Widget build(BuildContext context) {
    double raduis = 30.0;

    return BlocBuilder<UserBirthDayInfoBLoc, UserBirthDayInfoState>(
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
        child: const Tooltip(
          message: 'Ваши 3 коина за др ждут вас в отделе HR',
          child: Icon(
            Icons.question_mark,
            color: ColorsForWidget.colorGreen,
          ),
        ),
      ),
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
                context.read<UserBirthDayInfoBLoc>().add(
                    UserBirthDayInfoEvent.fetch(
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
