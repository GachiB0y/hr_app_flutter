import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';

class CreateRefactoringNewsScreen extends StatelessWidget {
  const CreateRefactoringNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BucketNavigator(bucket: 'create-news');
  }
}