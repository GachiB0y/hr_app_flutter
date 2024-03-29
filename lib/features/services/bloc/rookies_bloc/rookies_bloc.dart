import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

import '../../model/rookies_entity/rookies.dart';

part 'rookies_bloc.freezed.dart';
part 'rookies_event.dart';
part 'rookies_state.dart';

/// Business Logic Component RookiesBLoC
class RookiesBLoC extends Bloc<RookiesEvent, RookiesState>
    implements EventSink<RookiesEvent> {
  RookiesBLoC({
    required final IUserRepository userRepo,
    final RookiesState? initialState,
  })  : _userRepo = userRepo,
        super(
          initialState ??
              const RookiesState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<RookiesEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IUserRepository _userRepo;

  /// Fetch event handler
  Future<void> _fetch(
      RookiesEventFetch event, Emitter<RookiesState> emit) async {
    try {
      emit(RookiesState.processing(data: state.data));
      Rookies rookiesLoaded = await _userRepo
          .getRookiesInfo(startDate: event.startDate, endDate: event.endDate)
          .timeout(const Duration(seconds: 10));

      emit(RookiesState.successful(data: rookiesLoaded));
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the RookiesBLoC: $err', stackTrace);
      emit(RookiesState.error(data: state.data));
      rethrow;
    } finally {
      emit(RookiesState.idle(data: state.data));
    }
  }
}
