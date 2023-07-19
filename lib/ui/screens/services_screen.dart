import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});
  void _showModalSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      // backgroundColor: Colors.transparent,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              // color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.0)),
                      ),
                      child: BottomSheetCreateEventsWidget(),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                // Контейнер "летающей" ручки
                width: 50.0,
                height: 10.0,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize:
              0.8, // Измените это значение, чтобы задать начальный размер листа
          minChildSize:
              0.8, // Измените это значение, чтобы задать минимальный размер листа
          maxChildSize:
              0.8, // Измените это значение, чтобы задать максимальный размер листа
          expand: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return Column(
              children: [
                Container(
                  // Контейнер "летающей" ручки
                  width: 50.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: BottomSheetCreateEventsWidget()),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: const Text(
                'События',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              trailing: IconButton(
                  onPressed: () {
                    // showModalBottomSheet<void>(
                    //   isScrollControlled: true,
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return BottomSheetCreateEventsWidget();
                    //   },
                    // );
                    _showModalSheet(context);
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    size: 35,
                    color: ColorsForWidget.colorGreen,
                  )),
            ),
          ),
        ],
      )),
    );
  }
}

class BottomSheetCreateEventsWidget extends StatefulWidget {
  BottomSheetCreateEventsWidget({super.key});

  @override
  State<BottomSheetCreateEventsWidget> createState() =>
      _BottomSheetCreateEventsWidgetState();
}

class _BottomSheetCreateEventsWidgetState
    extends State<BottomSheetCreateEventsWidget> {
  int selectedTab = 0;
  final List<String> tabs = [
    'Актуальное',
    'Новости',
    'Сотрудники',
    'Мероприятия'
  ];
  TextEditingController dataDescriptionController = TextEditingController();
  TextEditingController dataTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        // height: MediaQuery.of(context).size.height * 0.5,
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
                child: Text(
                  'Тип события',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ),
              const ScrollWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: DateRangePickerWidget(),
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
              Center(
                child: ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
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
      // maxLength: 256,
      // expands: true,
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
  const ScrollWidget({super.key});

  @override
  _ScrollWidgetState createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  List<String> items = ['Актуальное', 'Новости', 'Сотрудники', 'Мероприятия'];
  List<String> selectedItems = [];

  void selectItem(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          bool isSelected = selectedItems.contains(item);

          return GestureDetector(
            onTap: () {
              selectItem(item);
              print(selectedItems);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                item,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DateRangePickerWidget extends StatefulWidget {
  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  TextEditingController dateRangeController = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  Future<void> selectDateRange(BuildContext context) async {
    final pickedDates = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: startDate != null && endDate != null
          ? DateTimeRange(start: startDate, end: endDate)
          : null,
    );

    if (pickedDates != null) {
      setState(() {
        startDate = pickedDates.start;
        endDate = pickedDates.end;
        updateDateRangeText();
      });
    }
  }

  void updateDateRangeText() {
    final formatter = DateFormat('d MMM');
    String start =
        startDate != null ? formatter.format(startDate) : 'Start Date';
    String end = endDate != null ? formatter.format(endDate) : 'End Date';
    String dateRangeText = '$start - $end';
    dateRangeController.text = dateRangeText;
  }

  @override
  void dispose() {
    dateRangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectDateRange(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: dateRangeController,
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
