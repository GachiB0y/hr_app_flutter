import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_title_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/AppBarCreateRefactoringScreens.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/continue_button.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/header_title.dart';
import 'package:octopus/octopus.dart';

class CreateTitleNewsScreen extends StatelessWidget {
  /// Экран написания заголовка новости при создании или модерации.
  const CreateTitleNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateRefactoringTitleNewsCubit>();
    return BlocBuilder<CreateRefactoringTitleNewsCubit, CreateRefactoringTitleNewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarCreateRefactoringNewsScreens(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const HeaderTitle(title: 'Напиши заголовок'),
                const SizedBox(height: 30),
                TextFormField(
                  maxLength: 256,
                  maxLines: 10,
                  minLines: 5,
                  controller: cubit.searchController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xfff5f5f5),
                    filled: true,
                    hintText: 'Введите заголовок',
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле обязательно для заполнения';
                    }
                    return null;
                  },
                ),

                const Spacer(),
                ContinueButton(
                  onTap: () {
                    context.octopus.setState(
                      (state) => state
                        ..findByName('user-main-tab')?.add(
                          Routes.createTypeNewsScreen.node(),
                        ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
