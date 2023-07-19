import 'package:hr_app_flutter/domain/blocs/event_entity_cubit.dart';
import 'package:hr_app_flutter/domain/entity/event_entity.dart';

class EventEntityApiClient implements EventEntityApi {
  @override
  Future<List<EventEntity>> getEvents() async {
    List<EventEntity> events = [
      EventEntity(
          title: 'Заголовок 1',
          description: 'Новости 1',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Новости']),
      EventEntity(
          title: 'Заголовок 2',
          description: 'Актуальное - Новости 2',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Актуальное', 'Новости']),
      EventEntity(
          title: 'Заголовок 3',
          description: 'Актуальное - Сотрудники 3',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Актуальное', 'Сотрудники']),
      EventEntity(
          title: 'Заголовок 4',
          description: 'Актуальное - Сотрудники 4',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Актуальное', 'Сотрудники']),
      EventEntity(
          title: 'Заголовок 5',
          description: 'Актуальное - Сотрудники - Новости 5',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Актуальное', 'Новости', 'Сотрудники']),
      EventEntity(
          title: 'Заголовок 6',
          description: 'Актуальное - Сотрудники - Новости 6',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Актуальное', 'Новости', 'Сотрудники']),
      EventEntity(
          title: 'Заголовок 7',
          description: 'Мероприятия - Сотрудники  7',
          imagePath:
              'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
          dateFrom: DateTime.now(),
          dateTo: DateTime.now().subtract(const Duration(days: 1)),
          tags: ['Мероприятия', 'Соотрудники']),
    ];
    await Future.delayed(const Duration(seconds: 1), () => "Hello Dart");
    return events;
  }
}
