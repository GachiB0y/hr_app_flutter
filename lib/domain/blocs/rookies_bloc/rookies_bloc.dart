import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/rookies_entity/rookies.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

part 'rookies_bloc.freezed.dart';
// part 'rookies_bloc.g.dart';
part 'rookies_event.dart';
part 'rookies_state.dart';

// class RookiesBloc extends Bloc<RookiesEvent, RookiesState> {
//   final IUserRepository userRepo;
//   final IAuthRepository authRepository;

//   RookiesBloc({
//     required this.userRepo,
//     required this.authRepository,
//   }) : super(const RookiesState.loading()) {
//     on<RookiesEvent>((event, emit) async {
//       if (event is RookiesEventFetch) {
//         await onRookiesEventFetch(emit);
//       }
//     });
//   }

//   Future<void> onRookiesEventFetch(Emitter<RookiesState> emit) async {
//     emit(const RookiesState.loading());
//     try {
//       String? accessToken = await authRepository.cheskIsLiveAccessToken();

//       Rookies rookiesLoaded = await userRepo
//           .getRookiesInfo(userToken: accessToken as String)
//           .timeout(const Duration(seconds: 10));

//       emit(RookiesState.loaded(rookiesLoaded: rookiesLoaded));
//     } on TimeoutException {
//       emit(const RookiesState.error());
//     } catch (e) {
//       emit(const RookiesState.error());
//     }
//   }
// }

/// Business Logic Component RookiesBLoC
class RookiesBLoC extends Bloc<RookiesEvent, RookiesState>
    implements EventSink<RookiesEvent> {
  RookiesBLoC({
    required final IUserRepository userRepo,
    required final IAuthRepository authRepository,
    final RookiesState? initialState,
  })  : _userRepo = userRepo,
        _authRepository = authRepository,
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

  // final IRookiesRepository _repository;
  final IUserRepository _userRepo;
  final IAuthRepository _authRepository;

  /// Fetch event handler
  Future<void> _fetch(
      RookiesEventFetch event, Emitter<RookiesState> emit) async {
    try {
      emit(RookiesState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();

      Rookies rookiesLoaded = await _userRepo
          .getRookiesInfo(userToken: accessToken as String)
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
