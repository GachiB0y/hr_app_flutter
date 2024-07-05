import 'package:flutter/material.dart';

class PhotoPlaceholder extends StatelessWidget {
  /// Заглушка если нет фото.
  const PhotoPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 8,
          offset: const Offset(0, 0),
        ),
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_a_photo_outlined,
            size: 70,
            color: Colors.black,
          ),
          Text(
            'Добавь фото\nЖеательно горизонтальное фото',
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}