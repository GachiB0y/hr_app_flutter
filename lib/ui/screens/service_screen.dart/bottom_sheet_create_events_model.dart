import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomSheetCreateEventsModel extends Listenable {
  // Создание списка слушателей
  final List<VoidCallback> _listeners = [];

  List<String>? selectedItems = [];
  DateTime? startDate = DateTime.now();
  DateTime? endDate;
  String? base64Image;
  Uint8List? bytesSend;
  String errorMessage = '';
  File? file;

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

  Future<void> selectDateRange(
      {required BuildContext context,
      required dateRangeController,
      required bool isSingleDay}) async {
    if (isSingleDay) {
    } else {
      final pickedDates = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1),
        initialDateRange: startDate != null && endDate != null
            ? DateTimeRange(
                start: startDate as DateTime, end: endDate as DateTime)
            : null,
      );

      if (pickedDates != null) {
        startDate = pickedDates.start;
        endDate = pickedDates.end;
        updateDateRangeText(dateRangeController);
      }
    }

    notifyListeners();
  }

  void updateDateRangeText(dateRangeController) {
    final formatter = DateFormat('d MMM');
    String start = startDate != null
        ? formatter.format(startDate as DateTime)
        : 'Start Date';
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
