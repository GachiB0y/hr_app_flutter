import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController? nameController,
    required Icon? iconData,
    required String inputText,
    this.readOnly = false,
    this.initialValue,
  })  : _nameController = nameController,
        _iconData = iconData,
        _inputText = inputText;

  final TextEditingController? _nameController;
  final Icon? _iconData;
  final String _inputText;
  final bool readOnly;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_inputText,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface)),
          TextFormField(
            initialValue: initialValue,
            readOnly: readOnly,
            maxLines: 10,
            minLines: 1,
            controller: _nameController,
            decoration: InputDecoration(
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
}
