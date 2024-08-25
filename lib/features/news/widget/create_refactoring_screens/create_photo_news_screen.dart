import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_photo_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/checking_news_screen.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/AppBarCreateRefactoringScreens.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/continue_button.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/header_title.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/photo_widget.dart';
import 'package:hr_app_flutter/ui/library/scaffold_manager/scaffold_manager.dart';
import 'package:octopus/octopus.dart';

class CreatePhotoNewsScreen extends StatelessWidget {
  /// Экран выбора фотографии при создании или модерации.
  const CreatePhotoNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateRefactoringPhotoNewsCubit>();
    return BlocBuilder<CreateRefactoringPhotoNewsCubit, CreateRefactoringPhotoNewsState>(
      builder: (context, state) => state.isNewsChecked
            ? CheckingNewsScreen(
                news: state.currentNews,
                file: state.file!,
              )
            : ScaffoldManager(
        status: state.status,
                appBar: AppBarCreateRefactoringNewsScreens(
                  id: cubit.state.currentNews.id.toString(),
                  reset: cubit.reset,
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const HeaderTitle(title: 'Добавь фото'),
                      const SizedBox(height: 30),
                      PhotoWidget(
                        onTap: cubit.changePhoto,
                        imageUrl: state.currentNews.image,
                        file: state.file,
                      ),
                      const Spacer(),
                      ContinueButton(
                        isCreate: state.currentNews.id == 0,
                        onTap: () {
                          cubit.saveChanges();
                          if (state.currentNews.id != 0) {
                            context.octopus.setState(
                              (state) => state..removeByName(Routes.createModerationScreensBucket.name),
                            );
                          }
                        },
                        text: state.currentNews.id != 0 ? 'Сохранить изменения' : 'Создать',
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
    );
  }
}
