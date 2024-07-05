import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hr_app_flutter/ui/commons/app_progress_indicator.dart';
import 'package:octo_image/octo_image.dart';

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
      children: urlImage == null ? [
        SizedBox(
          height: height ?? 274,
          width: width ?? double.maxFinite,
          child: const Center(
            child: Text('Нет фотографии'),
          ),
        ),
      ] : [
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
                child: OctoImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(urlImage!),
                  placeholderBuilder: (context) => const SizedBox(
                      height: 50,
                      width: 50,
                      child: AppProgressIndicator()),
                ),


                // Image.network(
                //   urlImage,
                // ),
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
