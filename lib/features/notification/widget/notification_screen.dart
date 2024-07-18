import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/notification/bloc/notification_bloc/notification_bloc.dart';
import 'package:hr_app_flutter/features/notification/model/notification.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Уведомления'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: const BodyWidget(),
      );
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<NotificationBLoC, NotificationState>(
        builder: (context, state) => state.map(
          idle: (state) => ListNotification(
            notifications: state.data,
          ),
          processing: (state) => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          successful: (state) => ListNotification(
            notifications: state.data,
          ),
          error: (state) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Произошла ошибка',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                ),
                Text(state.message),
              ],
            ),
          ),
        ),
      );
}

class ListNotification extends StatelessWidget {
  const ListNotification({required this.notifications, super.key});
  final List<NotificationEntity>? notifications;

  @override
  Widget build(BuildContext context) => notifications == null ||
          notifications!.isEmpty
      ? Center(
          child: Text(
            'Нет уведомлений',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
          ),
        )
      : CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final notification = notifications![index];

                  final formatter = DateFormat('dd MMMM', 'ru_RU');
                  final formattedDate = formatter.format(notification.date);
// например, "01 января"
                  return ListTile(
                    minLeadingWidth: 18,
                    leading: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: notification.isRead
                            ? const Color.fromARGB(255, 0, 0, 0)
                            : Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    title: Text(
                      notification.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                    ),
                    trailing: Text(
                      formattedDate,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                    ),
                    onTap: () {
                      debugPrint(notification.description);
                    },
                  );
                },
                childCount: notifications!.length,
              ),
            ),
          ],
        );
}
