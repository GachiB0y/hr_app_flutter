import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/blocs/caregory_bloc.dart/category_bloc.dart';
import '../../../domain/blocs/event_entity_bloc/event_entity_bloc.dart';
import '../../../library/custom_provider/inherit_widget.dart';
import '../../../theme/colors_from_theme.dart';
import 'bottom_sheet_create_events_model.dart';
import 'my_picker_image.dart';

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

  bool isSingleDay = false;

  @override
  Widget build(BuildContext context) {
    final viewModelBottomSheet = ChangeNotifierProvaider.watch<
        ChangeNotifierProvaider<BottomSheetCreateEventsModel>,
        BottomSheetCreateEventsModel>(context);
    List<String> selectedCategories =
        viewModelBottomSheet?.selectedItems as List<String>;
    String errorMessage = viewModelBottomSheet?.errorMessage as String;
    DateTime startDate = viewModelBottomSheet?.startDate as DateTime;
    DateTime? endDate = viewModelBottomSheet?.endDate;

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
              CheckboxMenuButton(
                  value: isSingleDay,
                  onChanged: (value) {
                    setState(() {
                      isSingleDay = !isSingleDay;
                    });
                  },
                  child: const Text('Весь день')),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: DateRangePickerWidget(
                  dateRangeController: dateRangeController,
                  isSingleDay: isSingleDay,
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
  final bool isSingleDay;

  const DateRangePickerWidget({
    super.key,
    required this.dateRangeController,
    required this.isSingleDay,
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
    final modelBottomSheet = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<BottomSheetCreateEventsModel>,
        BottomSheetCreateEventsModel>(context);
    return GestureDetector(
      onTap: () => widget.isSingleDay
          ? modelBottomSheet?.selectDateTime(
              context, widget.dateRangeController)
          : modelBottomSheet?.selectDateRange(
              dateRangeController: widget.dateRangeController,
              context: context,
            ),
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
