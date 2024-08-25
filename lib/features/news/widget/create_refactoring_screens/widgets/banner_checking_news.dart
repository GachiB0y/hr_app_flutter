import 'package:flutter/material.dart';

class BannerCheckingNews extends StatelessWidget {
  const BannerCheckingNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(211, 242, 212, 1),
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
