import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/user_birth_day_info_bloc/user_birth_day_info_bloc.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';

import '../../../domain/repository/auth_repository.dart';
import '../../../domain/repository/user_repository.dart';
import '../../../library/custom_provider/inherit_widget.dart';
import '../service_screen.dart/bottom_sheet_create_events_model.dart';

@RoutePage()
class BirthDayInfoScreen extends StatelessWidget implements AutoRouteWrapper {
  BirthDayInfoScreen(
      {super.key, required this.authRepository, required this.userRepo});
  final AuthRepository authRepository;
  final UserRepository userRepo;
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
        backgroundColor: ColorsForWidget.colorGreen,
        title: const Text('Именники'),
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
  TextEditingController dateRangeController = TextEditingController();
  String selectedDateRange = '';
  @override
  void initState() {
    super.initState();
    context
        .read<UserBirthDayInfoBLoc>()
        .add(const UserBirthDayInfoEvent.fetch());
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
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(raduis),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () => ChangeNotifierProvaider.watch<
                                      ChangeNotifierProvaider<
                                          BottomSheetCreateEventsModel>,
                                      BottomSheetCreateEventsModel>(context)
                                  ?.selectDateRange(
                                      context: context,
                                      dateRangeController: dateRangeController),
                              child: const Icon(Icons.calendar_today)),
                          const SizedBox(width: 10),
                          Text(
                            dateRangeController.text,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
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
                        child: ListView.builder(
                          itemCount: state.data!.birthdays.length,
                          itemBuilder: (context, index) {
                            String dateBirthDay =
                                state.data!.birthdays[index].dateBirth;
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                  ],
                );
        }
      },
    );
  }
}
