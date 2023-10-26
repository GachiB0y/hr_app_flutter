import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LeanProductionFormScreenModel extends Listenable {
  // Создание списка слушателей
  final List<VoidCallback> _listeners = [];

  String fileName = '';

  FilePickerResult? result;
  String? path;
  List<String?> paths = [];
  List<String?> fileNames = [];

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

  void pickFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'txt', 'doc', 'jpg', 'png'],
    );

    if (result != null) {
      path = result!.files.single.path;

      result!.files.forEach((element) {
        // paths.clear(); // ЗАГЛУШКА НА ОДИН ФАИЛ
        // fileNames.clear(); // ЗАГЛУШКА НА ОДИН ФАИЛ
        paths.add(element.path);
        fileNames.add(element.name);
      });
      fileName = result!.files.single.name;

      notifyListeners();
    }
  }

  void deleteFile({required int indexFile}) {
    paths.removeAt(indexFile);
    fileNames.removeAt(indexFile);
    notifyListeners();
  }
}
