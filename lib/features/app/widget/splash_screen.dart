import 'package:flutter/material.dart';

class InitializationSplashScreen extends StatelessWidget {
  const InitializationSplashScreen({super.key});

  // final ValueListenable<({int progress, String message})> progress;

  @override
  Widget build(BuildContext context) {
    final theme = View.of(context).platformDispatcher.platformBrightness ==
            Brightness.dark
        ? ThemeData.dark()
        : ThemeData.light();
    return const Material(
      // color: theme.primaryColor,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: Text('LOading...'),
          //  ListView(
          //   shrinkWrap: true,
          //   children: const <Widget>[
          //     CircularProgressIndicator(),
          //     SizedBox(height: 16),

          //   ],
          // ),
        ),
      ),
    );
  }
}
