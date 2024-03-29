import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';

import '../../model/birth_day_info/birth_day_info.dart';

part 'user_birth_day_info_bloc.freezed.dart';
part 'user_birth_day_info_event.dart';
part 'user_birth_day_info_state.dart';

/// Business Logic Component UserBirthDayInfoBLoC
class UserBirthDayInfoBLoc
    extends Bloc<UserBirthDayInfoEvent, UserBirthDayInfoState>
    implements EventSink<UserBirthDayInfoEvent> {
  UserBirthDayInfoBLoc({
    required final IUserRepository userRepo,
    final UserBirthDayInfoState? initialState,
  })  : _userRepo = userRepo,
        super(
          initialState ??
              const UserBirthDayInfoState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<UserBirthDayInfoEvent>(
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
  Future<void> _fetch(UserBirthDayInfoEventFetch event,
      Emitter<UserBirthDayInfoState> emit) async {
    try {
      emit(UserBirthDayInfoState.processing(data: state.data));

      BirthDayInfoEntity birthDayInfoLoaded = await _userRepo
          .getBirthDayInfo(startDate: event.startDate, endDate: event.endDate)
          .timeout(const Duration(seconds: 10));

      emit(UserBirthDayInfoState.successful(data: birthDayInfoLoaded));
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the UserBirthDayInfoBLoC: $err', stackTrace);
      emit(UserBirthDayInfoState.error(data: state.data));
      rethrow;
    } finally {
      emit(UserBirthDayInfoState.idle(data: state.data));
    }
  }
}
