// ignore_for_file: unused_catch_stack

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
import 'package:hr_app_flutter/features/user/data/repo/user_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

import '../../model/user/user.dart';

part 'other_users_bloc.freezed.dart';
// part 'other_users_bloc.g.dart';
part 'other_users_event.dart';
part 'other_users_state.dart';

// class OtherUsersBloc extends Bloc<OtherUsersEvent, OtherUserState> {
//   final IUserRepository userRepo;
//   final IAuthRepository authRepository;

//   OtherUsersBloc({
//     required this.userRepo,
//     required this.authRepository,
//   }) : super(const OtherUserState.loaded(
//             listUsersLoaded: [], currentProfileUser: null)) {
//     on<OtherUsersEvent>(
//       (event, emit) => event.map<Future<void>>(
//         gethUsersByPhoneNumber: (event) async =>
//             await _onOtherUsersEventGethUsersByPhoneNumber(emit, event),
//         clearList: (event) => _onOtherUsersEventClearList(emit),
//         gethUsersByUserId: (event) async =>
//             await _onOtherUsersEventGethUsersByUserId(emit, event.userId),
//         findUsers: (event) async =>
//             await _onOtherUsersEventFindUsers(emit, event),
//         saveTagsToSend: (event) async =>
//             await _onOtherUsersEvenSaveTagsToSend(emit, event),
//         addTag: (event) => _onOtherUsersEventAddTag(emit, event),
//         deleteTag: (event) => _onOtherUsersEventDeleteTag(emit, event),
//         sendAvatarWithProfile: (event) async =>
//             await _onOtherUsersEventSendAvatarWithProfile(emit, event),
//       ),
//     );
//   }

//   Future<void> _onOtherUsersEventClearList(Emitter<OtherUserState> emit) async {
//     emit(const OtherUserState.loaded(
//         listUsersLoaded: [], currentProfileUser: null));
//   }

//   Future<void> _onOtherUsersEventGethUsersByPhoneNumber(
//       Emitter<OtherUserState> emit,
//       OtherUsersEventGethUsersByPhoneNumber event) async {
//     try {
//       String? accessToken = await authRepository.cheskIsLiveAccessToken();
//       List<User> listUsersLoaded = await userRepo
//           .getUserByPhoneNumber(
//               userToken: accessToken as String, phoneNumber: event.phoneNumber)
//           .timeout(const Duration(seconds: 10));

//       final newState = (state as OtherUserStateLoaded)
//           .copyWith(listUsersLoaded: listUsersLoaded);

//       emit(newState);
//     } on TimeoutException {
//       emit(const OtherUserState.error(errorText: 'Время ожидания истекло!'));
//     } catch (e) {
//       emit(const OtherUserState.error());
//     }
//   }

//   Future<void> _onOtherUsersEventGethUsersByUserId(
//       Emitter<OtherUserState> emit, String userID) async {
//     try {
//       String? accessToken = await authRepository.cheskIsLiveAccessToken();
//       User currentUserProfile = await userRepo
//           .getUserInfoById(userToken: accessToken as String, userID: userID)
//           .timeout(const Duration(seconds: 10));
//       final newState = (state as OtherUserStateLoaded)
//           .copyWith(currentProfileUser: currentUserProfile);

//       emit(newState);
//     } on TimeoutException {
//       emit(const OtherUserState.error(errorText: 'Время ожидания истекло!'));
//     } catch (e) {
//       emit(const OtherUserState.error());
//     }
//   }

//   Future<void> _onOtherUsersEventFindUsers(
//       Emitter<OtherUserState> emit, OtherUsersEventFindUsers event) async {
//     try {
//       String? accessToken = await authRepository.cheskIsLiveAccessToken();
//       List<User> listUsersLoaded = await userRepo
//           .findUser(userToken: accessToken as String, findText: event.findText)
//           .timeout(const Duration(seconds: 10));

//       final newState = OtherUserStateLoaded(
//           listUsersLoaded: listUsersLoaded, currentProfileUser: null);

//       emit(newState);
//     } on TimeoutException {
//       emit(const OtherUserState.error(errorText: 'Время ожидания истекло!'));
//     } catch (e) {
//       emit(const OtherUserState.error());
//     }
//   }

//   Future<void> _onOtherUsersEvenSaveTagsToSend(
//       Emitter<OtherUserState> emit, OtherUsersEventSaveTagsToSend event) async {
//     try {
//       String? accessToken = await authRepository.cheskIsLiveAccessToken();

//       final oldState = (state as OtherUserStateLoaded);
//       emit(OtherUserState.loading(
//           listUsersLoaded: oldState.listUsersLoaded,
//           currentProfileUser: oldState.currentProfileUser));
//       bool isSendTags = await userRepo
//           .saveTagsToSend(
//               userToken: accessToken as String,
//               tags: event.tags,
//               userId: event.userId)
//           .timeout(const Duration(seconds: 10));
//       if (isSendTags) {
//         User currentUserProfile = await userRepo
//             .getUserInfoById(
//                 userToken: accessToken, userID: event.userId.toString())
//             .timeout(const Duration(seconds: 10));
//         final copyListUsersLoaded =
//             (state as OtherUserStateLoading).copyWith().listUsersLoaded;
//         final newState = OtherUserStateLoaded(
//             currentProfileUser: currentUserProfile,
//             listUsersLoaded: copyListUsersLoaded!);
//         emit(newState);
//       }
//     } on TimeoutException {
//       emit(const OtherUserState.error(errorText: 'Время ожидания истекло!'));
//     } on ApiClientExceptionType {
//       emit(const OtherUserState.error(
//           errorText:
//               'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
//     } catch (e) {
//       emit(const OtherUserState.error());
//     }
//   }

//   Future<void> _onOtherUsersEventAddTag(
//       Emitter<OtherUserState> emit, OtherUsersEventAddTag event) async {
//     final copyProfile =
//         (state as OtherUserStateLoaded).currentProfileUser?.copyWith();
//     if (copyProfile != null) {
//       final newListTags = [...copyProfile.tags];
//       newListTags.add(event.tag);
//       final newProfile = (state as OtherUserStateLoaded)
//           .currentProfileUser
//           ?.copyWith(tags: newListTags);

//       final newState = (state as OtherUserStateLoaded)
//           .copyWith(currentProfileUser: newProfile);
//       emit(newState);
//     } else {
//       emit(const OtherUserState.error(errorText: 'Ошибка добавления тэга'));
//     }
//   }

//   Future<void> _onOtherUsersEventDeleteTag(
//       Emitter<OtherUserState> emit, OtherUsersEventDeleteTag event) async {
//     final copyProfile =
//         (state as OtherUserStateLoaded).currentProfileUser?.copyWith();
//     if (copyProfile != null) {
//       final newListTags = [...copyProfile.tags];
//       newListTags.remove(event.tag);
//       final newProfile = (state as OtherUserStateLoaded)
//           .currentProfileUser
//           ?.copyWith(tags: newListTags);

//       final newState = (state as OtherUserStateLoaded)
//           .copyWith(currentProfileUser: newProfile);
//       emit(newState);
//     } else {
//       emit(const OtherUserState.error(errorText: 'Ошибка удаления тэга'));
//     }
//   }

//   _onOtherUsersEventSendAvatarWithProfile(Emitter<OtherUserState> emit,
//       OtherUsersEventSendAvatarWithProfile event) async {
//     String? accessToken = await authRepository.cheskIsLiveAccessToken();
//     try {
//       final oldState = (state as OtherUserStateLoaded);
//       emit(OtherUserState.loading(
//           listUsersLoaded: oldState.listUsersLoaded,
//           currentProfileUser: oldState.currentProfileUser));
//       bool isSendAvatar = await userRepo
//           .sendAvatarWithProfile(
//               userToken: accessToken as String, imageFile: event.imageFile)
//           .timeout(const Duration(seconds: 10));
//       if (isSendAvatar) {
//         User currentUserProfile = await userRepo
//             .getUserInfoById(
//                 userToken: accessToken, userID: event.userId.toString())
//             .timeout(const Duration(seconds: 10));
//         final copyListUsersLoaded =
//             (state as OtherUserStateLoading).copyWith().listUsersLoaded;
//         final newState = OtherUserStateLoaded(
//             currentProfileUser: currentUserProfile,
//             listUsersLoaded: copyListUsersLoaded!);
//         emit(newState);
//       }
//     } on TimeoutException {
//       emit(const OtherUserState.error(errorText: 'Время ожидания истекло!'));
//     } on ApiClientExceptionType {
//       emit(const OtherUserState.error(
//           errorText:
//               'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
//     } catch (e) {
//       emit(const OtherUserState.error());
//     }
//   }
// }

/// Business Logic Component OtherUsersBLoC
class OtherUsersBloc extends Bloc<OtherUsersEvent, OtherUsersState>
    implements EventSink<OtherUsersEvent> {
  OtherUsersBloc({
    required final IUserRepository userRepo,
    required final IAuthRepository authRepository,
    final OtherUsersState? initialState,
  })  : _userRepo = userRepo,
        _authRepository = authRepository,
        super(
          initialState ??
              const OtherUsersState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<OtherUsersEvent>(
      (event, emit) => event.map<Future<void>>(
        gethUsersByPhoneNumber: (event) async =>
            await _onOtherUsersEventGetUsersByPhoneNumber(emit, event),
        clearList: (event) => _onOtherUsersEventClearList(emit),
        // gethUsersByUserId: (event) async =>
        //     await _onOtherUsersEventGetUsersByUserId(emit, event.userId),
        findUsers: (event) async =>
            await _onOtherUsersEventFindUsers(emit, event),
        // saveTagsToSend: (event) async =>
        //     await _onOtherUsersEvenSaveTagsToSend(emit, event),
        // addTag: (event) => _onOtherUsersEventAddTag(emit, event),
        // deleteTag: (event) => _onOtherUsersEventDeleteTag(emit, event),
        // sendAvatarWithProfile: (event) async =>
        //     await _onOtherUsersEventSendAvatarWithProfile(emit, event),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final IUserRepository _userRepo;
  final IAuthRepository _authRepository;

  /// Get users by phone number
  Future<void> _onOtherUsersEventGetUsersByPhoneNumber(
    Emitter<OtherUsersState> emit,
    OtherUsersEventGethUsersByPhoneNumber event,
  ) async {
    try {
      emit(OtherUsersState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();
      List<User> listUsersLoaded = await _userRepo
          .getUserByPhoneNumber(
              userToken: accessToken as String, phoneNumber: event.phoneNumber)
          .timeout(const Duration(seconds: 10));

      emit(OtherUsersState.successful(data: listUsersLoaded));
    } on TimeoutException {
      emit(OtherUsersState.error(
          data: state.data, message: 'Время ожидания истекло!'));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the OtherUsersBLoC: $err', stackTrace);
      emit(const OtherUsersState.error(data: null));
      rethrow;
    } finally {
      emit(OtherUsersState.idle(data: state.data));
    }
  }

  /// Clear list users
  Future<void> _onOtherUsersEventClearList(
      Emitter<OtherUsersState> emit) async {
    emit(const OtherUsersState.idle(data: []));
  }

  // /// Get users by user id
  // Future<void> _onOtherUsersEventGetUsersByUserId(
  //     Emitter<OtherUsersState> emit, String userID) async {
  //   try {
  //     emit(OtherUsersState.processing(data: state.data));
  //     String? accessToken = await _authRepository.cheskIsLiveAccessToken();
  //     User currentProfileUser = await _userRepo
  //         .getUserInfoById(userToken: accessToken as String, userID: userID)
  //         .timeout(const Duration(seconds: 10));

  //     emit(OtherUsersState.successful(
  //         data: state.data?.copyWith(currentProfileUser: currentProfileUser)));
  //   } on TimeoutException {
  //     emit(OtherUsersState.error(
  //         data: state.data, message: 'Время ожидания истекло!'));
  //   } on Object catch (err, stackTrace) {
  //     //l.e('An error occurred in the OtherUsersBLoC: $err', stackTrace);
  //     emit(OtherUsersState.error(data: state.data));
  //     rethrow;
  //   } finally {
  //     emit(OtherUsersState.idle(data: state.data));
  //   }
  // }

  /// Find users
  Future<void> _onOtherUsersEventFindUsers(
      Emitter<OtherUsersState> emit, OtherUsersEventFindUsers event) async {
    try {
      emit(OtherUsersState.processing(data: state.data));
      String? accessToken = await _authRepository.cheskIsLiveAccessToken();
      List<User> listUsersLoaded = await _userRepo
          .findUser(userToken: accessToken as String, findText: event.findText)
          .timeout(const Duration(seconds: 10));

      emit(OtherUsersState.successful(data: listUsersLoaded));
    } on TimeoutException {
      emit(OtherUsersState.error(
          data: state.data, message: 'Время ожидания истекло!'));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the OtherUsersBLoC: $err', stackTrace);
      emit(OtherUsersState.error(data: state.data));
      rethrow;
    } finally {
      emit(OtherUsersState.idle(data: state.data));
    }
  }

  // /// Save tags to send
  // Future<void> _onOtherUsersEvenSaveTagsToSend(Emitter<OtherUsersState> emit,
  //     OtherUsersEventSaveTagsToSend event) async {
  //   try {
  //     emit(OtherUsersState.processing(data: state.data));
  //     String? accessToken = await _authRepository.cheskIsLiveAccessToken();
  //     bool isSendTags = await _userRepo
  //         .saveTagsToSend(
  //             userToken: accessToken as String,
  //             tags: event.tags,
  //             userId: event.userId)
  //         .timeout(const Duration(seconds: 10));

  //     if (isSendTags) {
  //       User currentProfileUser = await _userRepo
  //           .getUserInfoById(
  //               userToken: accessToken, userID: event.userId.toString())
  //           .timeout(const Duration(seconds: 10));
  //       emit(OtherUsersState.successful(
  //           data:
  //               state.data?.copyWith(currentProfileUser: currentProfileUser)));
  //     } else {
  //       emit(OtherUsersState.error(
  //           data: state.data,
  //           message:
  //               'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
  //     }
  //   } on TimeoutException {
  //     emit(OtherUsersState.error(
  //         data: state.data, message: 'Время ожидания истекло!'));
  //   } on ApiClientExceptionType {
  //     emit(OtherUsersState.error(
  //         data: state.data,
  //         message:
  //             'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
  //   } on Object catch (err, stackTrace) {
  //     //l.e('An error occurred in the OtherUsersBLoC: $err', stackTrace);
  //     emit(OtherUsersState.error(data: state.data));
  //     rethrow;
  //   } finally {
  //     emit(OtherUsersState.idle(data: state.data));
  //   }
  // }

  // /// Add tag
  // Future<void> _onOtherUsersEventAddTag(
  //     Emitter<OtherUsersState> emit, OtherUsersEventAddTag event) async {
  //   final User? copyProfile = state.data?.currentProfileUser?.copyWith();
  //   if (copyProfile != null) {
  //     final newListTags = [...copyProfile.tags];
  //     newListTags.add(event.tag);
  //     final newProfile =
  //         state.data?.currentProfileUser?.copyWith(tags: newListTags);
  //     emit(OtherUsersState.idle(
  //         data: state.data?.copyWith(currentProfileUser: newProfile)));
  //   } else {
  //     emit(OtherUsersState.error(
  //         data: state.data, message: 'Ошибка добавления тэга.'));
  //   }
  // }

  // /// Delete tag
  // Future<void> _onOtherUsersEventDeleteTag(
  //     Emitter<OtherUsersState> emit, OtherUsersEventDeleteTag event) async {
  //   final copyProfile = state.data?.currentProfileUser?.copyWith();
  //   if (copyProfile != null) {
  //     final newListTags = [...copyProfile.tags];
  //     newListTags.remove(event.tag);
  //     final newProfile =
  //         state.data?.currentProfileUser?.copyWith(tags: newListTags);
  //     emit(OtherUsersState.idle(
  //         data: state.data?.copyWith(currentProfileUser: newProfile)));
  //   } else {
  //     emit(OtherUsersState.error(
  //         data: state.data, message: 'Ошибка удаления тэга.'));
  //   }
  // }

  // /// Send avatar
  // _onOtherUsersEventSendAvatarWithProfile(Emitter<OtherUsersState> emit,
  //     OtherUsersEventSendAvatarWithProfile event) async {
  //   try {
  //     emit(OtherUsersState.processing(data: state.data));
  //     String? accessToken = await _authRepository.cheskIsLiveAccessToken();
  //     bool isSendAvatar = await _userRepo
  //         .sendAvatarWithProfile(
  //             userToken: accessToken as String, imageFile: event.imageFile)
  //         .timeout(const Duration(seconds: 10));
  //     if (isSendAvatar) {
  //       User currentProfileUser = await _userRepo
  //           .getUserInfoById(
  //               userToken: accessToken, userID: event.userId.toString())
  //           .timeout(const Duration(seconds: 10));
  //       emit(OtherUsersState.successful(
  //           data:
  //               state.data?.copyWith(currentProfileUser: currentProfileUser)));
  //     } else {
  //       emit(OtherUsersState.error(
  //           data: state.data,
  //           message:
  //               'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
  //     }
  //   } on TimeoutException {
  //     emit(OtherUsersState.error(
  //         data: state.data, message: 'Время ожидания истекло!'));
  //   } on ApiClientExceptionType {
  //     emit(OtherUsersState.error(
  //         data: state.data,
  //         message:
  //             'Ошибка сохранения. Обновите страницу и попробуйте еще раз.'));
  //   } on Object catch (err, stackTrace) {
  //     //l.e('An error occurred in the OtherUsersBLoC: $err', stackTrace);
  //     emit(OtherUsersState.error(data: state.data));
  //     rethrow;
  //   } finally {
  //     emit(OtherUsersState.idle(data: state.data));
  //   }
  // }
}
