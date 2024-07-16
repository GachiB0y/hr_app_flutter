import 'package:flutter/material.dart';

class TypeNewsCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isSelected;


  /// Карточка категории новости.
  const TypeNewsCard({
    required this.onTap,
    required this.title,
    this.isSelected = false,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
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
          color:
              isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background,
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}
