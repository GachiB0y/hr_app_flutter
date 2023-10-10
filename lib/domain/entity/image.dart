import 'dart:io';

import 'dart:async';

import 'package:image_picker/image_picker.dart';

class MyImage {
  File? imageFile;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
  }
}
