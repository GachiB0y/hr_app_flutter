import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/birth_day_info/birth_day_info.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

import 'package:hr_app_flutter/domain/repository/user_repository.dart';

part 'user_birth_day_info_bloc.freezed.dart';
part 'user_birth_day_info_event.dart';
part 'user_birth_day_info_state.dart';

/// Business Logic Component UserBirthDayInfoBLoC
class UserBirthDayInfoBLoc
    extends Bloc<UserBirthDayInfoEvent, UserBirthDayInfoState>
    implements EventSink<UserBirthDayInfoEvent> {
  UserBirthDayInfoBLoc({
    required final IUserRepository userRepo,
    required final IAuthRepository authRepository,
    final UserBirthDayInfoState? initialState,
  })  : _userRepo = userRepo,
        _authRepository = authRepository,
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
  final IAuthRepository _authRepository;

  /// Fetch event handler
  Future<void> _fetch(UserBirthDayInfoEventFetch event,
      Emitter<UserBirthDayInfoState> emit) async {
    try {
      emit(UserBirthDayInfoState.processing(data: state.data));

      String? accessToken = await _authRepository.cheskIsLiveAccessToken();

      BirthDayInfoEntity birthDayInfoLoaded = await _userRepo
          .getBirthDayInfo(
              userToken: accessToken as String,
              startDate: event.startDate,
              endDate: event.endDate)
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
