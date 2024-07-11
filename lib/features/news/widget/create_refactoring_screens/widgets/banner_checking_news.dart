import 'package:flutter/material.dart';
import 'package:hr_app_flutter/ui/theme/app_colors.dart';

class BannerCheckingNews extends StatelessWidget {
  const BannerCheckingNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.green2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Новость на проверке',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
