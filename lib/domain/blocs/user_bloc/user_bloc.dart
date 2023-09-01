import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';
import 'package:hr_app_flutter/domain/repository/user_repository.dart';

part 'user_bloc.freezed.dart';
part 'user_bloc.g.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepo;
  UserBloc({required this.userRepo}) : super(const UserState.loading()) {
    on<UserEvent>((event, emit) async {
      if (event is UserEventFetch) {
        emit(const UserState.loading());
        try {
          User userLoaded = await userRepo
              .getBalance(userToken: event.userToken)
              .timeout(const Duration(seconds: 5));
          await Future<void>.delayed(const Duration(seconds: 2));
          emit(UserState.loaded(userLoaded: userLoaded));
        } on TimeoutException {
          emit(const UserState.error());
        } catch (e) {
          emit(const UserState.error());
        }
      }
    });
  }
}
