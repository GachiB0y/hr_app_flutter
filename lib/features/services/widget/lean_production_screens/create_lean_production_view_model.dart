import 'package:flutter/material.dart';

class CreateLeanProductionViewModel extends Listenable {
  // Создание списка слушателей
  final List<VoidCallback> _listeners = [];

  String? _problem;
  String? get problem => _problem;
  set problem(String? value) {
    _problem = value;
    notifyListeners();
  }

  String? _solution;
  String? get solution => _solution;
  set solution(String? value) {
    _solution = value;
    notifyListeners();
  }

  bool? _isImplemented;
  bool? get isImplemented => _isImplemented;
  set isImplemented(bool? value) {
    _isImplemented = value;
    notifyListeners();
  }

  String? _expenses;
  String? get expenses => _expenses;
  set expenses(String? value) {
    _expenses = value;
    notifyListeners();
  }

  String? _benefit;
  String? get benefit => _benefit;
  set benefit(String? value) {
    _benefit = value;
    notifyListeners();
  }

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

  void showError() {
    notifyListeners();
  }
}
