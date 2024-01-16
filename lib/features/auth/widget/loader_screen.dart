// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hr_app_flutter/features/auth/bloc/auth_bloc/auth_bloc.dart';
// import 'package:hr_app_flutter/features/auth/widget/auth_scope.dart';
// import 'package:hr_app_flutter/router/router.dart';

// @RoutePage()
// class LoaderScreen extends StatefulWidget {
//   const LoaderScreen({Key? key}) : super(key: key);

//   @override
//   State<LoaderScreen> createState() => _LoaderScreenState();
// }

// class _LoaderScreenState extends State<LoaderScreen> {
//   @override
//   void initState() {
//     super.initState();
//     final authController = AuthScope.of(context, listen: false);
//     authController.checkAuth();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthBLoC, AuthState>(
//       bloc: AuthScope.of(context).authBloc,
//       listener: (BuildContext context, AuthState state) async {
//         await _onLoaderViewCubitStateChange(context, state);
//       },
//       child: const Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }

//   Future<void> _onLoaderViewCubitStateChange(
//       BuildContext context, AuthState state) async {
//     final bool isAuth = state.data == AuthenticationStatus.authenticated;
//     final nextScreen =
//         isAuth ? const MainAppRoute() : AuthenticationFormRoute();

//     // AutoRouter.of(context).replace(nextScreen);
//   }
// }
