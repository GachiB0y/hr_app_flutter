import 'package:flutter/material.dart';
import 'package:hr_app_flutter/bloc_observable.dart';
import 'package:hr_app_flutter/di/di_coinatiner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppFactory {
  Widget makeApp();
}

final appFactory = makeAppFactory();

void main() {
  Bloc.observer = const AppBlocObserver();
  final app = appFactory.makeApp();
  runApp(app);
}
