import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomDatePickerModel extends Listenable {
  // Создание списка слушателей
  final List<VoidCallback> _listeners = [];

  // String dateReleaseBottle = '';
  DateTime selectedDate = DateTime.now();

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

  void setDateOfRelease(DateTime newValue) {
    selectedDate = newValue;
    notifyListeners();
  }
}
