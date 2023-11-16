import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/router/router.dart';

abstract class ScreenFactory {
  MultiBlocProvider createMultiBlocProvider();
  IAuthRepository makeAuthRepo();
  AppRouter makeAppRouter();
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
