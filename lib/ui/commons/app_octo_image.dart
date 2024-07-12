import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hr_app_flutter/ui/commons/app_progress_indicator.dart';
import 'package:octo_image/octo_image.dart';

class AppOctoImage extends StatelessWidget {
  /// URL изображения.
  final String urlImage;

  final Duration? fadeInDuration;

  /// Флаг индикатора загрузки.
  final bool isProgressIndicator;

  /// Билдер чилда.
  final Widget Function(BuildContext, Widget)? imageBuilder;

  /// Размер текста ошибки.
  final double? fontSize;

  const AppOctoImage({
    required this.urlImage,
    this.isProgressIndicator = true,
    this.fadeInDuration,
    this.imageBuilder,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OctoImage(
        imageBuilder: imageBuilder,
        fadeInDuration: fadeInDuration,
        fit: BoxFit.cover,
        image: CachedNetworkImageProvider(urlImage),
        placeholderBuilder: (context) => SizedBox(
              child: isProgressIndicator ? const AppProgressIndicator() : null,
            ),
        errorBuilder: (context, object, stackTrace) {
         return Text(
            'Нет фото',
            style: TextStyle(fontSize: fontSize),
          );
        });
  }
}
