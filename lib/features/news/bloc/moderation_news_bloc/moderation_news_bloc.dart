import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/features/news/data/repo/event_entity_repo.dart';

import '../../model/event_entity/new_event_entity.dart';

///____________________________________________________________________________________

class ModerationNewsState {
  final List<EventEntity> moderationNews;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModerationNewsState &&
          runtimeType == other.runtimeType &&
          moderationNews == other.moderationNews;

  @override
  int get hashCode => moderationNews.hashCode;

  ModerationNewsState({required this.moderationNews});

  ModerationNewsState copyWith({
    List<EventEntity>? moderationNews,
  }) {
    return ModerationNewsState(
      moderationNews: moderationNews ?? this.moderationNews,
    );
  }
}

class ModerationNewsCubit extends Cubit<ModerationNewsState> {
  final IEventEntityRepository eventEntityRepository;

  ModerationNewsCubit({required this.eventEntityRepository})
      : super(
          ModerationNewsState(moderationNews: []),
        ) {
    _initialize();
  }

  /// Инициализация состояния.
  Future<void> _initialize() async {
    final news = await eventEntityRepository.getApprovmentEvents();
    final newState = state.copyWith(moderationNews: news);
    emit(newState);
  }
}
