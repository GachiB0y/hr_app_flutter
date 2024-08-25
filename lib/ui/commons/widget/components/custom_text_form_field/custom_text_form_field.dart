import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required TextEditingController? nameController,
    required Icon? iconData,
    required String inputText,
    this.focusNode,
    this.readOnly = false,
    this.initialValue,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.inputDecoration,
    super.key,
  })  : _nameController = nameController,
        _iconData = iconData,
        _inputText = inputText;

  final TextEditingController? _nameController;
  final Icon? _iconData;
  final String _inputText;
  final bool readOnly;
  final String? initialValue;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final InputDecoration? inputDecoration;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _inputText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
            ),
            TextFormField(
              maxLength: maxLength,
              focusNode: focusNode,
              initialValue: initialValue,
              readOnly: readOnly,
              maxLines: maxLines ?? 10,
              minLines: minLines ?? 1,
              controller: _nameController,
              decoration: inputDecoration ?? InputDecoration(
                fillColor: Theme.of(context).colorScheme.onPrimary,
                filled: true,
                icon: _iconData,
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Поле обязательно для заполнения';
                }
                return null;
              },
            ),
          ],
        ),
      );
}
