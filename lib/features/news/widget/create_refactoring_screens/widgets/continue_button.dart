import 'package:flutter/material.dart';
import 'package:hr_app_flutter/ui/theme/app_colors.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color buttonColor;
  final Color splashColor;
  final String? text;
  final bool isCreate;

  /// Кнопка продолжения создания или модерирования новости.
  const ContinueButton({
    required this.onTap,
    this.buttonColor = AppColors.black,
    this.splashColor = AppColors.black,
    this.text,
    this.isCreate = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(splashColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                // Change your radius here
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              isCreate ? AppColors.green : AppColors.black,
            ),
            textStyle: MaterialStateProperty.all(const TextStyle(
              color: AppColors.white,
              fontSize: 27,
            ))),
        child: Text(
          text ?? 'Продолжить',
          style: const TextStyle(color: AppColors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
