import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/bloc/create_refactor/create_refactoring_photo_news_bloc.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/AppBarCreateRefactoringScreens.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/continue_button.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/header_title.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/photo_widget.dart';
import 'package:hr_app_flutter/ui/theme/app_colors.dart';

class CreatePhotoNewsScreen extends StatelessWidget {
  /// Экран выбора фотографии при создании или модерации.
  const CreatePhotoNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateRefactoringPhotoNewsCubit>();
    return BlocBuilder<CreateRefactoringPhotoNewsCubit, CreateRefactoringPhotoNewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarCreateRefactoringNewsScreens(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const HeaderTitle(title: 'Добавь фото'),
                const SizedBox(height: 30),
                PhotoWidget(
                  onTap: cubit.changePhoto,
                  imageUrl: state.currentNews?.image,
                  file: state.file,
                ),
                const Spacer(),
                ContinueButton(
                  onTap: () {
                    cubit.saveChanges();
                    // context.octopus.setState(
                    //   (state) => state
                    //     ..findByName('user-main-tab')?.add(
                    //       Routes.refactorModerationNewsScreen.node(),
                    //     ),
                    // );
                  },
                  text: state.currentNews?.id != null ? 'Сохранить изменения' : 'Создать',
                  buttonColor: state.currentNews?.id == null ? AppColors.green : AppColors.black,
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
