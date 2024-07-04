import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';
import 'package:hr_app_flutter/features/news/model/event_entity/new_event_entity.dart';
import 'package:hr_app_flutter/features/news/widget/refactor_moderation_news_screen.dart';
import 'package:hr_app_flutter/ui/commons/app_cupertino_action_sheet.dart';
import 'package:hr_app_flutter/ui/commons/show_actions.dart';
import 'package:hr_app_flutter/ui/library/scaffold_manager/scaffold_manager.dart';
import 'package:intl/intl.dart';
import 'package:octopus/octopus.dart';

///____________________________________________________________________________________
/// Состояние экрана [RefactorModerationNewsScreen].
class RefactorNewsState {
  /// Модерируемая новость.
  final EventEntity? news;

  /// Статус экрана.
  final ScaffoldManagerStatus status;

  /// Дата создания новости.
  final String? date;

  /// Время создания новости.
  final String? time;

  /// Полная дата создания новости.
  final String? createAt;

  /// Состояние экрана.
  final bool? valueState;

  RefactorNewsState({
    this.news,
    this.status = ScaffoldManagerStatus.loading,
    this.date,
    this.time,
    this.createAt,
    this.valueState,
  });

  RefactorNewsState copyWith({
    EventEntity? news,
    ScaffoldManagerStatus? status,
    String? date,
    String? time,
    String? createAt,
    bool? valueState,
  }) {
    return RefactorNewsState(
      news: news ?? this.news,
      status: status ?? this.status,
      date: date ?? this.date,
      time: time ?? this.time,
      createAt: createAt ?? this.createAt,
      valueState: valueState ?? this.valueState,
    );
  }
}

class RefactorNewsCubit extends Cubit<RefactorNewsState> {
  final IEventEntityRepository eventEntityRepository;
  final String? id;

  RefactorNewsCubit({
    required this.eventEntityRepository,
    required this.id,
  }) : super(
          RefactorNewsState(),
        ) {
    _initialize();
  }

  /// Получение новости по id.
  Future<void> getNewsById() async {
    if (id == null) return;
    await eventEntityRepository.getNewsById(id: id!);
    if(eventEntityRepository.currentNews == null) return;
    await _refDateTime(eventEntityRepository.currentNews!);
    final newState = state.copyWith(
      news: eventEntityRepository.currentNews!,
      status: ScaffoldManagerStatus.loaded,
    );
    emit(newState);
  }

  /// Инициализация состояния.
  Future<void> _initialize() async {
    await getNewsById();
  }

  /// Преобразование данных даты и времени.
  Future<void> _refDateTime(EventEntity news) async {
    final date = DateFormat('dd MMMM').format(news.startDate);
    final time = DateFormat('HH:mm').format(news.startDate);
    final createAt = DateFormat('dd.MM.yy').format(news.createdAt);
    final newState = state.copyWith(date: date, time: time, createAt: createAt);
    emit(newState);
  }

  /// Показать модалку новости.
  Future<void> openActionSheet({required BuildContext context, required int id}) async {
    ShowAction.cupertinoActionSheet(
      context: context,
      child: AppCupertinoActionSheet(
        id: id,
        onTapCancel: () => publishOrRejectNews(
          value: false,
          id: id.toString(),
        ),
        onTapRefactoring: (){
          context.octopus.setState(
                (state) => state
              ..findByName('user-main-tab')?.add(
                Routes.createTypeNewsScreen.node(),
              ),
          );
        },
      ),
    );
  }

  /// Опубликовать или отклонить новость.
  Future<void> publishOrRejectNews({
    required bool value,
    required String id,
  }) async {
    if (value) {
      await publishNews(id);
    } else {
      await moveInArchiveNews(id);
    }
    await eventEntityRepository.getApprovmentEvents();
    emit(state.copyWith(valueState: value));
  }

  /// Отклонить новость (переместить в архив).
  Future<void> moveInArchiveNews(String id) async {
    await eventEntityRepository.moveInArchiveNews(id: id);
  }

  /// Опубликовать новость.
  Future<void> publishNews(String id) async {
    await eventEntityRepository.approvementNews(id: id);
  }
}
