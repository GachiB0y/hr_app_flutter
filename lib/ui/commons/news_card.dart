import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart';
import 'package:hr_app_flutter/ui/commons/blur_image_widget.dart';
import 'package:intl/intl.dart';
import 'package:octopus/octopus.dart';

class NewsCard extends StatelessWidget {
  /// Виджет карточки новости.
  const NewsCard({
    super.key,
    required this.news,
  });

  final EventEntity news;

  @override
  Widget build(BuildContext context) {
    var id = {'id': news.id.toString()};
    return Padding(
      padding: const EdgeInsets.only(top: 11.0, bottom: 9.0, right: 11.0, left: 11.0),
      child: InkWell(
        onTap: () {
          context.octopus.setState(
            (state) => state
              ..findByName('${Routes.services.name}-tab')?.add(
                Routes.moderationNewsScreen.node(arguments: id),
              ),
          );
        },
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),

              ),
              child: BlurImageWidget(
                urlImage: news.image ?? '',
                height: 90,
                width: 107,
              ),
            ),
            const SizedBox(width: 22),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  (news.startDate != null) ?
                  _InfoDateWidget(
                    text: DateFormat('dd MMMM').format(
                      news.startDate!
                    ),
                  ) : const Text(''),
                  Text(
                    news.title ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    news.description ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12, color: Theme.of(context).colorScheme.outline),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoDateWidget extends StatelessWidget {
  const _InfoDateWidget({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(145),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 9,
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
