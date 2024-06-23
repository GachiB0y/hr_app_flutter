import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/home/widget/coming_soon_screen.dart';
import 'package:octopus/octopus.dart';

class EducationBucket extends StatelessWidget {
  const EducationBucket({super.key});

  @override
  Widget build(BuildContext context) {
    return BucketNavigator(
      bucket: '${Routes.education.name}-tab',
    );
  }
}

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CominSoonScreen();
  }
}
