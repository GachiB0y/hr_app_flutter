import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hr_app_flutter/features/news/widget/create_refactoring_screens/widgets/photo_placeholder.dart';

class PhotoWidget extends StatelessWidget {
  final File? file;
  final VoidCallback onTap;
  final String? imageUrl;

  /// Виджет выбора картинки.
  const PhotoWidget({
    required this.onTap,
    this.file,
    this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget body = const PhotoPlaceholder();
    if (imageUrl != null) {
      body = Image.network(imageUrl!);
    }
    if (file != null) {
      body = Image.file(file!);
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: body,
        ),
      ),
    );
  }
}
