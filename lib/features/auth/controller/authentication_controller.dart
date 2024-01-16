// import 'dart:async';

// import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
// import 'package:hr_app_flutter/core/controller/droppable_controller_concurrency.dart';
// import 'package:hr_app_flutter/core/controller/state_controller.dart';
// import 'package:hr_app_flutter/features/auth/controller/authentiocation_state.dart';
// import 'package:hr_app_flutter/features/auth/data/repo/auth_repository.dart';
// import 'package:hr_app_flutter/features/auth/model/user.dart';

// final class AuthenticationController
//     extends StateController<AuthenticationState>
//     with DroppableControllerConcurrency {
//   AuthenticationController(
//       {required IAuthRepository repository,
//       super.initialState =
//           const AuthenticationState.idle(user: AuthenticationStatus.initial)})
//       : _repository = repository {
//     _userSubscription = repository
//         .getAuthStateChanges()
//         .map<AuthenticationState>((u) => AuthenticationState.idle(user: u))
//         .where((newState) =>
//             state.isProcessing || !identical(newState.user, state.user))
//         .listen(setState, cancelOnError: false);
//   }

//   final IAuthRepository _repository;
//   StreamSubscription<AuthenticationState>? _userSubscription;

//   // /// Restore the session from the cache.
//   // void restore() => handle(
//   //       () async {
//   //         setState(
//   //           AuthenticationState.processing(
//   //             user: state.user,
//   //             message: 'Restoring session...',
//   //           ),
//   //         );
//   //         await _repository.restore();
//   //       },
//   //       (error, _) => setState(
//   //         const AuthenticationState.idle(
//   //           user: User.unauthenticated(),
//   //           error: 'Restore Error', // ErrorUtil.formatMessage(error)
//   //         ),
//   //       ),
//   //       () => setState(
//   //         AuthenticationState.idle(user: state.user),
//   //       ),
//   //     );

//   /// Sign in with the given [data].
//   void signIn(required String phone) => handle(
//         () async {
//           setState(
//             AuthenticationState.processing(
//               user: state.user,
//               message: 'Logging in...',
//             ),
//           );
//           await _repository.signIn(data);
//         },
//         (error, _) => setState(
//           AuthenticationState.idle(
//             user: state.user,
//             error: 'Sign In Error', // ErrorUtil.formatMessage(error)
//           ),
//         ),
//         () => setState(
//           AuthenticationState.idle(user: state.user),
//         ),
//       );

//   /// Sign out.
//   void signOut() => handle(
//         () async {
//           setState(
//             AuthenticationState.processing(
//               user: state.user,
//               message: 'Logging out...',
//             ),
//           );
//           await _repository.logout();
//         },
//         (error, _) => setState(
//           AuthenticationState.idle(
//             user: state.user,
//             error: 'Log Out Error', // ErrorUtil.formatMessage(error)
//           ),
//         ),
//         () => setState(
//           const AuthenticationState.idle(
//             user: User.unauthenticated(),
//           ),
//         ),
//       );

//   @override
//   void dispose() {
//     _userSubscription?.cancel();
//     super.dispose();
//   }
// }
