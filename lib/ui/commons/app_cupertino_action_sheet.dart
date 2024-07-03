import 'package:flutter/cupertino.dart';
import 'package:hr_app_flutter/ui/theme/app_colors.dart';

class AppCupertinoActionSheet extends StatelessWidget {
  final int id;
  final VoidCallback onTapCancel;
  final VoidCallback onTapRefactoring;
  /// Модалка выбора действий с новостью (Редактировать, Отклонить, Отмена).
  const AppCupertinoActionSheet({
    required this.id,
    required this.onTapCancel,
    required this.onTapRefactoring,
    super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        ColoredBox(
          color: AppColors.white,
          child: CupertinoActionSheetAction(
            child: const Text(
              'Редактировать',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            onPressed: () {
              onTapRefactoring();
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ),
        const SizedBox(
          width: double.infinity,
          height: 0.5,
        ),
        ColoredBox(
          color: AppColors.white,
          child: CupertinoActionSheetAction(
            child: const Text(
              'Отклонить',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            onPressed: () {onTapCancel();
            Navigator.of(context, rootNavigator: true).pop();
            }
          ),
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text(
          'Отмена',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
    );
  }
}
