import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

part 'user_bloc.freezed.dart';

part 'user_event.dart';
part 'user_state.dart';

/// Business Logic Component UserBLoC
class UserBloc extends Bloc<UserEvent, UserState>
    implements EventSink<UserEvent> {
  UserBloc({
    required final IUserRepository userRepo,
    required final IAuthRepository authRepository,
    final UserState? initialState,
  })  : _userRepo = userRepo,
        _authRepository = authRepository,
        super(
          initialState ??
              const UserState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<UserEvent>(
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
  Future<void> _fetch(UserEventFetch event, Emitter<UserState> emit) async {
    try {
      emit(UserState.processing(data: state.data));

      String? accessToken = await _authRepository.cheskIsLiveAccessToken();

      User userLoaded = await _userRepo
          .getUserInfo(userToken: accessToken as String)
          .timeout(const Duration(seconds: 10));
      emit(UserState.successful(data: userLoaded));
      // ignore: unused_catch_stack
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the UserBLoC: $err', stackTrace);
      emit(UserState.error(data: state.data));
      rethrow;
    } finally {
      emit(UserState.idle(data: state.data));
    }
  }
}
