import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/home/bloc/main_app_screen_view_cubit/main_app_screen_view_cubit.dart';
import 'package:hr_app_flutter/core/components/database/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/features/services/widget/service_screen.dart/bottom_sheet_create_events_model.dart';
import 'package:hr_app_flutter/features/services/widget/service_screen.dart/painteres_widget.dart';
import 'package:octopus/octopus.dart';

import '../../../news/bloc/event_entity_bloc/event_entity_bloc.dart';
import '../../model/service/service.dart';
import '../service_screen.dart/bottom_sheet_create_events_widget.dart';

class ServiceElementWidget extends StatefulWidget {
  const ServiceElementWidget({
    super.key,
    required this.title,
    required this.isRow,
    required this.service,
    this.idHandler,
    this.imagePath,
  });

  final String? imagePath;
  final String? title;
  final int? idHandler;
  final Service service;
  final bool isRow;

  @override
  State<ServiceElementWidget> createState() => _ServiceElementWidgetState();
}

class _ServiceElementWidgetState extends State<ServiceElementWidget> {
  final BottomSheetCreateEventsModel _model = BottomSheetCreateEventsModel();

  get imagePath => widget.imagePath;
  void openBottomSheet({
    required BuildContext context,
    required MainAppScreenViewCubit cubitMainAppScreen,
  }) {
    cubitMainAppScreen.changeVisibleBottomBar(true);
    showModalBottomSheet(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocListener<EventEntityBloc, EventEntityState>(
          listener: (BuildContext context, EventEntityState state) {
            if (state is EventEntityState$Error) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Center(
                        child: Text('Ошибка отправки.\nПопробуйте снова.')),
                    duration: Duration(seconds: 6),
                  ),
                );
            } else if (state is EventEntityState$Successful) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Center(
                        child: Text(
                      'Данные успешно отправленны!',
                      style: TextStyle(fontSize: 20),
                    )),
                    duration: Duration(seconds: 2),
                  ),
                ).closed.then((value) => Navigator.pop(context));
            }
          },
          child: DraggableScrollableSheet(
            initialChildSize:
                0.8, // Измените это значение, чтобы задать начальный размер листа
            minChildSize:
                0.8, // Измените это значение, чтобы задать минимальный размер листа
            maxChildSize:
                1.0, // Измените это значение, чтобы задать максимальный размер листа
            expand: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                            height: 26,
                          ),
                        ),
                        SizedBox(
                          height: 26,
                          width: 52,
                          child: CustomPaint(
                            // size: Size(50, 50),
                            painter: PainterLeft(),
                          ),
                        ),
                        Container(
                          width: 25.0,
                          height: 5.0,
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        Container(
                          // Контейнер "летающей" ручки
                          width: 50.0,
                          height: 5.0,

                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        Container(
                          width: 25.0,
                          height: 5.0,
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        SizedBox(
                          height: 26,
                          width: 52,
                          child: CustomPaint(
                            // size: Size(50, 50),
                            painter: PainterRight(),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 26,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: ChangeNotifierProvaider<
                              BottomSheetCreateEventsModel>(
                            model: _model,
                            child: const BottomSheetCreateEventsWidget(),
                          )),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    ).whenComplete(() {
      cubitMainAppScreen.changeVisibleBottomBar(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    const double radius = 18.0;
    final cubitMainAppScreen = context.watch<MainAppScreenViewCubit>();
    final sizeScreen = MediaQuery.of(context).size;

    final sizeWidhtIsRow = (sizeScreen.width / 3.9);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: BorderRadius.circular(radius),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          width: widget.isRow ? sizeWidhtIsRow : null,
          height: (MediaQuery.of(context).size.height / 8.0),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              bottom: 16.0,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                textAlign: TextAlign.left,
                widget.title ?? widget.service.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ),
        SizedBox(
          width: widget.isRow ? sizeWidhtIsRow : null,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                imagePath ?? 'assets/images/note.png',
              ),
            ),
          ),
        ),
        SizedBox(
          width: widget.isRow ? sizeWidhtIsRow : null,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(radius),
              onTap: () async {
                if (widget.service.id == 22 &&
                    widget.service.permissions.createService == true &&
                    widget.idHandler == 1) {
                  Octopus.of(context).push(Routes.createNewsType);

                  // openBottomSheet(
                  //   context: context,
                  //   cubitMainAppScreen: cubitMainAppScreen,
                  // );
                } else if (widget.service.id == 22 &&
                    widget.service.permissions.approveService == true &&
                    widget.idHandler == 2) {
                  Octopus.of(context).push(Routes.approveNews);
                } else if (widget.service.id == 25) {
                  Octopus.of(context).push(Routes.scheduleBus);
                } else if (widget.service.id == 24) {
                  Octopus.of(context).push(Routes.statementsForm);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
