import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_type_news_bloc.dart';
import 'package:octopus/octopus.dart';

class CreateRefactoringNewsScreen extends StatelessWidget {
  const CreateRefactoringNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRefactoringTypeNewsCubit, CreateRefactoringTypeNewsState>(
        builder: (context, state) {
      return const BucketNavigator(bucket: 'create-type-news-screen');
    });
  }
}
