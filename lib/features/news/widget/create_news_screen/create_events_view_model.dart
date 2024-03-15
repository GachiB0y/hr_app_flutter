import 'dart:io';
import 'package:flutter/cupertino.dart';
// import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateEventsViewModel extends Listenable {
  // Создание списка слушателей
  final List<VoidCallback> _listeners = [];

  List<String>? _selectedItems = [];
  List<String>? get selectedItems => _selectedItems;
  set selectedItems(List<String>? value) {
    _selectedItems = value;
    notifyListeners();
  }

  String? _title;
  String? get title => _title;
  set title(String? value) {
    _title = value;
    notifyListeners();
  }

  String? _description;
  String? get description => _description;
  set description(String? value) {
    _description = value;
    notifyListeners();
  }

  DateTime _startDate = DateTime.now();
  DateTime get startDate => _startDate;
  set startDate(DateTime value) {
    _startDate = value;
    notifyListeners();
  }

  File? _file;
  File? get file => _file;
  set file(File? value) {
    _file = value;
    notifyListeners();
  }

  DateTime? endDate;

  String? base64Image;
  Uint8List? bytesSend;
  String errorMessage = '';

  // Метод для добавления слушателей
  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  // Метод для удаления слушателей
  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  // Метод для уведомления слушателей об изменениях
  void notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  Future<void> selectDateRange({
    required BuildContext context,
    required dateRangeController,
  }) async {
    final pickedDates = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDateRange: endDate != null
          ? DateTimeRange(start: startDate, end: endDate as DateTime)
          : null,
    );

    if (pickedDates != null) {
      _startDate = pickedDates.start;
      endDate = pickedDates.end;
      updateDateRangeText(dateRangeController);
    }

    notifyListeners();
  }

  Future<void> selectDateTime(BuildContext context, dateRangeController) async {
    TimeOfDay? pickedTime;
    DateTime? selectedDate = DateTime.now();
    TimeOfDay? selectedTime;
    DateTime? dateTime;
    final formatter = DateFormat('HH:mm dd.MM.yyyy', 'ru');

    if (Platform.isIOS) {
      await showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: DateTime.now(),
                    use24hFormat: true,
                    onDateTimeChanged: (DateTime value) {
                      selectedDate = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 64.0),
                  child: TextButton(
                      onPressed: () {
                        dateRangeController.text =
                            formatter.format(selectedDate!);
                        endDate = null;
                        Navigator.pop(context);
                        notifyListeners();
                      },
                      child: const Text(
                        'Выбрать',
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
            ),
          );
        },
      );
    } else {
      await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      ).then((value) async {
        if (value != null) {
          selectedDate = value;

          pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
        }
      });
    }

    if (pickedTime != null && pickedTime != selectedTime) {
      selectedTime = pickedTime;
      dateTime = DateTime(selectedDate!.year, selectedDate!.month,
          selectedDate!.day, selectedTime!.hour, selectedTime.minute);
      dateRangeController.text = formatter.format(dateTime);
      notifyListeners();
    }
  }

  void updateDateRangeText(dateRangeController) {
    final formatter = DateFormat('d MMM');
    String start = formatter.format(startDate);
    String end =
        endDate != null ? formatter.format(endDate as DateTime) : 'End Date';
    String dateRangeText = '$start - $end';
    dateRangeController.text = dateRangeText;
    notifyListeners();
  }

  void showError() {
    errorMessage = 'Заполните все поля!!!';
    notifyListeners();
  }
}
