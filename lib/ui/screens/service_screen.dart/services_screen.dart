import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/caregory_bloc.dart/category_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/event_entity_bloc/event_entity_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/service_bloc/service_bloc.dart';
import 'package:hr_app_flutter/library/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/router/router.dart';
import 'package:hr_app_flutter/ui/screens/service_screen.dart/bottom_sheet_create_events_model.dart';
import 'package:hr_app_flutter/ui/screens/service_screen.dart/my_picker_image.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';

@RoutePage()
class ServicesScreen extends StatefulWidget {
  const ServicesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ServiceBloc>().add(const ServiceEvent.fetch(isRow: false));
  }

  // Создание списка групп
  List<Widget> groupWidgets = [];

  @override
  Widget build(BuildContext context) {
    final blocServiceBloc = context.read<ServiceBloc>();
    const double raiudsBorder = 30;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          color: ColorsForWidget.colorGreen,
          onRefresh: () {
            blocServiceBloc.add(const ServiceEvent.fetch(isRow: false));
            return Future<void>.delayed(const Duration(seconds: 1));
          },
          child: CustomScrollView(
            slivers: <Widget>[
              blocServiceBloc.state.when(
                loading: () {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                },
                loaded: (loadedService, loeadedServiceWidgets) {
                  groupWidgets.clear();

                  for (var widget in loeadedServiceWidgets) {
                    groupWidgets.add(widget);
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: groupWidgets,
                    ),
                  );
                },
                error: () =>
                    const SliverToBoxAdapter(child: Text('Nothing found...')),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(raiudsBorder),
                      color: ColorsForWidget.colorGreen),
                  child: TextButton(
                      onPressed: () {
                        context.pushRoute(BagReportRoute(
                            authRepository: blocServiceBloc.authRepository,
                            serviceRepository:
                                blocServiceBloc.serviceRepository));
                      },
                      child: const Text(
                        'Сообщить об ошибке',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetCreateEventsWidget extends StatefulWidget {
  const BottomSheetCreateEventsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetCreateEventsWidget> createState() =>
      _BottomSheetCreateEventsWidgetState();
}

class _BottomSheetCreateEventsWidgetState
    extends State<BottomSheetCreateEventsWidget> {
  final TextEditingController dataDescriptionController =
      TextEditingController();
  final TextEditingController dataTitleController = TextEditingController();
  final TextEditingController dateRangeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> selectedCategories = ChangeNotifierProvaider.watch<
            ChangeNotifierProvaider<BottomSheetCreateEventsModel>,
            BottomSheetCreateEventsModel>(context)
        ?.selectedItems as List<String>;
    String errorMessage = ChangeNotifierProvaider.watch<
            ChangeNotifierProvaider<BottomSheetCreateEventsModel>,
            BottomSheetCreateEventsModel>(context)
        ?.errorMessage as String;
    DateTime startDate = ChangeNotifierProvaider.watch<
            ChangeNotifierProvaider<BottomSheetCreateEventsModel>,
            BottomSheetCreateEventsModel>(context)
        ?.startDate as DateTime;
    DateTime endDate = ChangeNotifierProvaider.watch<
            ChangeNotifierProvaider<BottomSheetCreateEventsModel>,
            BottomSheetCreateEventsModel>(context)
        ?.endDate as DateTime;

    final blocEventEntity = context.read<EventEntityBloc>();
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  'Создать событие',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: MyPickerImage(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  'Тип события',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ),
              ScrollWidget(
                selectedCategories: selectedCategories,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: DateRangePickerWidget(
                  dateRangeController: dateRangeController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFieldTitleWidget(
                    dataTitleController: dataTitleController),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFieldDescriptionWidget(
                    dataDescriptionController: dataDescriptionController),
              ),
              const SizedBox(
                height: 10,
              ),
              errorMessage != ''
                  ? Center(
                      child: Text(
                        ChangeNotifierProvaider.watch<
                                ChangeNotifierProvaider<
                                    BottomSheetCreateEventsModel>,
                                BottomSheetCreateEventsModel>(context)
                            ?.errorMessage as String,
                        style: const TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    )
                  : const SizedBox.shrink(),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorsForWidget.colorGreen),
                    ),
                    child: const Text(
                      'Создать',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      if (dataDescriptionController.text.isEmpty ||
                          dataTitleController.text.isEmpty ||
                          dateRangeController.text.isEmpty ||
                          selectedCategories.isEmpty) {
                        ChangeNotifierProvaider.read<
                                ChangeNotifierProvaider<
                                    BottomSheetCreateEventsModel>,
                                BottomSheetCreateEventsModel>(context)
                            ?.showError();
                        return;
                      }

                      blocEventEntity.add(EventEntityEvent.createNewEventEntity(
                          title: dataTitleController.text,
                          description: dataDescriptionController.text,
                          imageFile: ChangeNotifierProvaider.read<
                                  ChangeNotifierProvaider<
                                      BottomSheetCreateEventsModel>,
                                  BottomSheetCreateEventsModel>(context)
                              ?.file! as File,
                          categories: selectedCategories,
                          startDate: startDate.toString(),
                          endDate: endDate.toString()));
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldTitleWidget extends StatelessWidget {
  const TextFieldTitleWidget({
    super.key,
    required this.dataTitleController,
  });

  final TextEditingController dataTitleController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 256,
      controller: dataTitleController,
      decoration: const InputDecoration(
        labelStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey),
        labelText: 'Заголовок',
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class TextFieldDescriptionWidget extends StatelessWidget {
  const TextFieldDescriptionWidget({
    super.key,
    required this.dataDescriptionController,
  });

  final TextEditingController dataDescriptionController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      controller: dataDescriptionController,
      decoration: const InputDecoration(
        labelStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey),
        labelText: 'Описание',
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class ScrollWidget extends StatefulWidget {
  final List<String> selectedCategories;
  const ScrollWidget({super.key, required this.selectedCategories});

  @override
  _ScrollWidgetState createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  void selectItem(String item) {
    setState(() {
      if (widget.selectedCategories.contains(item)) {
        widget.selectedCategories.remove(item);
      } else {
        widget.selectedCategories.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final blocCategory = context.watch<CategoryBloc>();
    return blocCategory.state.when(
        loading: () {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
        loaded: (listCategory) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: listCategory.map((item) {
                bool isSelected =
                    widget.selectedCategories.contains(item.id.toString());

                return GestureDetector(
                  onTap: () {
                    selectItem(item.id.toString());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      item.name,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
        error: () => const Text('Nothing found...'));
  }
}

class DateRangePickerWidget extends StatefulWidget {
  final TextEditingController dateRangeController;

  const DateRangePickerWidget({
    super.key,
    required this.dateRangeController,
  });
  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  @override
  void dispose() {
    widget.dateRangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ChangeNotifierProvaider.read<
              ChangeNotifierProvaider<BottomSheetCreateEventsModel>,
              BottomSheetCreateEventsModel>(context)
          ?.selectDateRange(context, widget.dateRangeController),
      child: AbsorbPointer(
        child: TextFormField(
          controller: widget.dateRangeController,
          decoration: const InputDecoration(
            labelStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey),
            labelText: 'Время проведения',
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
