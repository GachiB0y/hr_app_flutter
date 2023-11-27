import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/model/image.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileWidgetModel extends Listenable {
  // Создание списка слушателей
  final List<VoidCallback> _listeners = [];

  bool isSave = false;
  File? file;
  final MyImage myImage = MyImage();
  bool isChangeTags = false;

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

  void changeIsSave({required bool newValue, required bool isTags}) {
    if (isSave != newValue) {
      isSave = newValue;
      isChangeTags = isTags;
      notifyListeners();
    }
  }

  Future<void> selectImage() async {
    await myImage.pickImage(ImageSource.gallery);
    notifyListeners();
  }
}
