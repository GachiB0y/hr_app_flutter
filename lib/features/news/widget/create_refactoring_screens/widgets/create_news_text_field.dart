import 'package:flutter/material.dart';

class CreateNewsTextField extends StatelessWidget {
  /// Текстовое поле для создания заголовка и описания новости.
  const CreateNewsTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.maxLength,
    this.maxLines,
  });

  final TextEditingController controller;
  final String? hintText;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) => TextFormField(
      maxLength: maxLength ?? 256,
      maxLines: maxLines ?? 10,
      minLines: 5,
      controller: controller,
      decoration: InputDecoration(
        fillColor: const Color(0xfff5f5f5),
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
}