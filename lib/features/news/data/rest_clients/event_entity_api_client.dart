// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:intl/intl.dart';
import '../../model/event_entity/new_event_entity.dart';

abstract interface class IEventsEntityProvider {
  Future<List<EventEntity>> getEvents();

  Future<EventEntity> getNewsById({
    required String id,
  });

  /// Получение массива новостей для модерации.
  Future<List<EventEntity>> getApprovmentEvents();

  Future<List<Category>> getCategory();

  Future<bool> createNewEventEntity({
    required String title,
    required String description,
    required String startDate,
    required String? endDate,
    required List<String> paths,
    required List<String> categories,
  });

  /// Сохранение изменений модерируемой новости.
  Future<void> updateNews({
    required EventEntity news,
    File? file,
  });

  Future<bool> approvementNews({
    required String id,
  });

  Future<bool> moveInArchiveNews({
    required String id,
  });
}

class EventsEntityProviderImpl implements IEventsEntityProvider {
  final RestClient _httpService;

  const EventsEntityProviderImpl(this._httpService);

  @override
  Future<List<EventEntity>> getEvents() async {
    final response = await _httpService.get(
      '/news/all',
    );

    if (response
        case {
          'result': final List<dynamic> data,
        }) {
      final List<EventEntity> result = (data).map((item) => EventEntity.fromJson(item)).toList();
      return result;
    }
    throw Exception('Error fetching EventsEntity');
  }

  @override
  Future<List<Category>> getCategory() async {
    final response = await _httpService.get(
      '/news/categories',
    );

    if (response
        case {
          'result': final List<dynamic> data,
        }) {
      final List<Category> result = (data).map((item) => Category.fromJson(item)).toList();
      return result;
    }
    throw Exception('Error fetching Category');
  }

  @override
  Future<bool> createNewEventEntity(
      {required String title,
      required String description,
      required String startDate,
      required String? endDate,
      required List<String> paths,
      required List<String> categories}) async {
    final fields = {
      'some_other_data':
          '{"title":"$title","description":"$description","start_date":"$startDate","end_date": ${endDate == null ? null : '"$endDate"'},"categories":$categories}'
    };
    final response = await _httpService.post(
      '/news/add_feed',
      pathsToFiles: paths,
      body: fields,
    );

    if (response case final Map<String, Object?> data) {
      return true;
    }
    throw Exception('Error create New EventEntity!!!');
  }

  @override
  Future<void> updateNews({
    required EventEntity news,
    File? file,
  }) async {
    List<String> categories = [];
    if (news.categories != null) {
      for (var e in news.categories!) {
        categories.add(e.id.toString());
      }
    }
    String? start;
    String? end;
    if (news.startDate != null) {
      start = DateFormat('yyyy-MM-ddTHH:mm:ss').format(news.startDate!);
    }
    if (news.endDate != null) {
      end = DateFormat('yyyy-MM-ddTHH:mm:ss').format(news.endDate!);
    }
    final fields = {
      'some_data': '{ "id": "${news.id}",'
          ' "title": "${news.title}", '
          ' "description": "${news.description}",'
          ' "start_date": "$start",'
          ' "end_date": "$end",'
          ' "categories": $categories}'
    };
    final response = await _httpService.post(
      '/news/update_feed',
      isFormData: true,
      pathsToFiles: file == null ? null : [file.path],
      body: fields,
      headers: {"Content-Type": "multipart/form-data"},
    );
  }

  // @override
  // Future<void> updateNews({
  //   required EventEntity news,
  //   File? file,
  // }) async {
  //   final List<String> categories = [];
  //   if (news.categories != null) {
  //     for (var e in news.categories!) {
  //       categories.add(e.id.toString());
  //     }
  //   }
  //
  //   final fields = {
  //     'some_other_data':
  //         '{"title":"${news.title}","description":"${news.description}","start_date":"2023-10-19T11:52:18.628","end_date": "2023-10-19T11:52:18.628","categories":$categories}'
  //   };
  //
  //   final response = await _httpService.post(
  //     'news/update_feed',
  //     body: fields,
  //     pathsToFiles: null);
  //   // if (response case final Map<String, Object?> data) {
  //   //   return;
  //   // }
  //   // throw Exception('Error update EventEntity!!!');
  // }

  @override
  Future<List<EventEntity>> getApprovmentEvents() async {
    final response = await _httpService.get(
      '/news/approvement_list',
    );

    if (response
        case {
          'result': final List<dynamic> data,
        }) {
      final List<EventEntity> result = (data).map((item) => EventEntity.fromJson(item)).toList();
      return result;
    }
    throw Exception('Error fetching  Approvment Events');

    // } else if (response.statusCode == 404) {
    //   throw ApiClientException(ApiClientExceptionType.notFound);
    // } else {
    //   throw Exception('Error fetching  Approvment Events');
    // }
  }

  @override
  Future<bool> approvementNews({required String id}) async {
    final response = await _httpService.post(
      '/news/approve_feed',
      queryParams: {
        'feed_id': id,
      },
      body: {},
    );

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      return true;
    }
    throw Exception('Error approvement News!!!');
  }

  @override
  Future<EventEntity> getNewsById({required String id}) async {
    final response = await _httpService.get(
      '/news/find/$id',
    );

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      final EventEntity result = EventEntity.fromJson(data);
      return result;
    }
    throw Exception('Error fetching News By Id');
  }

  @override
  Future<bool> moveInArchiveNews({required String id}) async {
    final response = await _httpService.post('/news/move_in_archive', body: {}, queryParams: {'feed_id': id});

    if (response
        case {
          'result': final Map<String, Object?> data,
        }) {
      return true;
    }
    throw Exception('Error move In Archive News!!!');
  }
}
