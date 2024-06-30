import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/components/database/custom_provider/inherit_widget.dart';

import 'file_picker_custom_model.dart';

class CustomFABFromFilePicker extends StatelessWidget {
  const CustomFABFromFilePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.attach_file),
      onPressed: () => ChangeNotifierProvaider.read<
              ChangeNotifierProvaider<FilePickerCustomModel>,
              FilePickerCustomModel>(context)
          ?.pickFile(),
    );
  }
}

class CustomFABFromImagePicker extends StatelessWidget {
  const CustomFABFromImagePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.attach_file),
      onPressed: () => ChangeNotifierProvaider.read<
              ChangeNotifierProvaider<FilePickerCustomModel>,
              FilePickerCustomModel>(context)
          ?.pickImage(),
    );
  }
}
