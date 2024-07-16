import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color buttonColor;
  final Color splashColor;
  final String? text;
  final bool isCreate;

  /// Кнопка продолжения создания или модерирования новости.
  const ContinueButton({
    required this.onTap,
    this.buttonColor = Colors.black,
    this.splashColor = Colors.black,
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
              isCreate ? Colors.green : Colors.black,
            ),
            textStyle: MaterialStateProperty.all(const TextStyle(
              color: Colors.white,
              fontSize: 27,
            ))),
        child: Text(
          text ?? 'Продолжить',
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
