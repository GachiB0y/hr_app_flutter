import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/home/widget/coming_soon_screen.dart';
import 'package:octopus/octopus.dart';

class CompanyBucket extends StatelessWidget {
  const CompanyBucket({super.key});

  @override
  Widget build(BuildContext context) {
    return BucketNavigator(
      bucket: '${Routes.company.name}-tab',
    );
  }
}

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CominSoonScreen();
  }
}
