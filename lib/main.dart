import 'package:flutter/material.dart';
import 'package:hr_app_flutter/di/di_coinatiner.dart';

abstract class AppFactory {
  Widget makeApp();
}

final appFactory = makeAppFactory();

void main() {
  final app = appFactory.makeApp();
  runApp(app);
}
