import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:hr_app_flutter/features/auth/widget/auth_scope.dart';
import 'package:hr_app_flutter/features/auth/widget/auth_screen.dart';
import 'package:hr_app_flutter/features/home/widget/main_app_screen.dart';
import 'package:hr_app_flutter/router/router.dart';

import '../bloc/loader_cubit/loader_view_cubit.dart';

@RoutePage()
class LoaderScreen extends StatefulWidget {
  const LoaderScreen({Key? key}) : super(key: key);

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    super.initState();
    // final auth = AuthScope.of(context, listen: false);
    // auth.checkAuth();
    final auth = AuthScope.of(context, listen: false);

    final nextScreen = auth.authenticated
        ? const MainAppRoute()
        : const AuthenticationFormRoute();

    AutoRouter.of(context).replace(nextScreen);
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // return AuthScope.of(context).authenticated
    //     ? const MainAppScreen()
    //     : const AuthenticationFormScreen();
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _onLoaderViewCubitStateChange(BuildContext context, AuthState state) {
    final nextScreen = state.data == AuthenticationStatus.authenticated
        ? const MainAppRoute()
        : const AuthenticationFormRoute();

    AutoRouter.of(context).replace(nextScreen);
  }
}
