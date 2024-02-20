import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/widget/components/custom_circular_progress_indicator/custom_circular_progress_indicator.dart';

class InitializationSplashScreen extends StatelessWidget {
  const InitializationSplashScreen({super.key});

  // final ValueListenable<({int progress, String message})> progress;

  @override
  Widget build(BuildContext context) {
    // final theme = View.of(context).platformDispatcher.platformBrightness ==
    //         Brightness.dark
    //     ? ThemeData.dark()
    //     : ThemeData.light();
    // return const Material(
    //   child: Directionality(
    //     textDirection: TextDirection.ltr,
    //     child: Center(
    //       child: Text('LOading...'),
    //     ),
    //   ),
    // );
    return const Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Color(0xFF33A936),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 170,
                ),
                ImageLogoWidget(),
                CustomProgressIndicatorWidget(),
                ChangingText(),
                SizedBox(
                  height: 110,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageLogoWidget extends StatelessWidget {
  const ImageLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Stack(children: [
          Positioned(
            left: 69.0,
            top: 109.0,
            child: Image.asset('assets/images/leaf.png'),
          ),
          Image.asset('assets/images/grass_with_love.png'),
        ]),
      ),
    );
  }
}

class ChangingText extends StatefulWidget {
  const ChangingText({super.key});

  @override
  _ChangingTextState createState() => _ChangingTextState();
}

class _ChangingTextState extends State<ChangingText> {
  List<String> textOptions = [
    'Мы переобулись',
    'Химичу',
    'Поговорим на чистоту'
  ];
  int currentIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      timer =
          Timer.periodic(const Duration(seconds: 1), (Timer t) => changeText());
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void changeText() {
    setState(() {
      currentIndex = (currentIndex + 1) % textOptions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Text(
        textOptions[currentIndex],
        key: ValueKey<int>(currentIndex),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 33),
      ),
    );
  }
}
