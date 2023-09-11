import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ScreenFactory {
  MultiBlocProvider createMultiBlocProvider();
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.screenFactory,
  });

  final ScreenFactory screenFactory;

  @override
  Widget build(BuildContext context) {
    return screenFactory.createMultiBlocProvider();
  }
}
