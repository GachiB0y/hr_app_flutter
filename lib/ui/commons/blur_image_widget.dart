import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_octo_image.dart';

class BlurImageWidget extends StatelessWidget {
  final String? urlImage;
  final double? height;
  final double? width;
  final bool backButton;

  /// Виджет изображения с размытым фоном.
  const BlurImageWidget({
    this.urlImage,
    this.height,
    this.width,
    this.backButton = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: urlImage == null
          ? [
              SizedBox(
                height: height ?? 274,
                width: width ?? double.maxFinite,
                child: const Center(
                  child: Text('Нет фотографии'),
                ),
              ),
            ]
          : [
              Container(
                height: height ?? 274,
                width: width ?? double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      urlImage!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.grey.withOpacity(0.1),
                      child: AppOctoImage(
                        urlImage: urlImage!,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(136, 255, 255, 255),
                  ),
                  child: backButton ? const BackButton() : null,
                ),
              ),
            ],
    );
  }
}
