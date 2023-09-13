import 'package:flutter/material.dart';
import 'package:hr_app_flutter/di/di_coinatiner.dart';
import 'package:hr_app_flutter/library/custom_provider/inherit_widget.dart';

abstract class AppFactory {
  Widget makeApp();
}

final appFactory = makeAppFactory();

void main() {
  final app = appFactory.makeApp();
  runApp(app);
}

// void main() {
//   runApp(const MaterialApp(
//     home: Example(),
//   ));
// }
