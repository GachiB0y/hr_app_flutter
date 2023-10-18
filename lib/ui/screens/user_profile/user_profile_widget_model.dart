import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserProfileWidgetModel extends Listenable {
  // Создание списка слушателей
  final List<VoidCallback> _listeners = [];

  bool isSave = false;

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

  void changeIsSave(bool newValue) {
    if (isSave != newValue) {
      isSave = newValue;
      notifyListeners();
    }
  }
}
