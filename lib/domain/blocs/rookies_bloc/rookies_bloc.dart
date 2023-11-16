import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/rookies_entity/rookies.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';

part 'rookies_bloc.freezed.dart';
part 'rookies_bloc.g.dart';
part 'rookies_event.dart';
part 'rookies_state.dart';

class RookiesBloc extends Bloc<RookiesEvent, RookiesState> {
  final IUserRepository userRepo;
  final IAuthRepository authRepository;

  RookiesBloc({
    required this.userRepo,
    required this.authRepository,
  }) : super(const RookiesState.loading()) {
    on<RookiesEvent>((event, emit) async {
      if (event is RookiesEventFetch) {
        await onRookiesEventFetch(emit);
      }
    });
  }

  Future<void> onRookiesEventFetch(Emitter<RookiesState> emit) async {
    emit(const RookiesState.loading());
    try {
      String? accessToken = await authRepository.cheskIsLiveAccessToken();

      Rookies rookiesLoaded = await userRepo
          .getRookiesInfo(userToken: accessToken as String)
          .timeout(const Duration(seconds: 10));

      emit(RookiesState.loaded(rookiesLoaded: rookiesLoaded));
    } on TimeoutException {
      emit(const RookiesState.error());
    } catch (e) {
      emit(const RookiesState.error());
    }
  }
}
