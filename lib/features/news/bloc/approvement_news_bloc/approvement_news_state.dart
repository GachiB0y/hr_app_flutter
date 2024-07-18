part of 'approvement_news_bloc.dart';

// @freezed
// class ApprovementNewsState with _$ApprovementNewsState {
//   const factory ApprovementNewsState.loading() = ApprovementNewsStateLoading;
//   const factory ApprovementNewsState.loaded({
//     required List<EventEntity> listApprovmentEventEntityLoaded,
//   }) = ApprovementNewsStateLoaded;
//   const factory ApprovementNewsState.error({required String? errorText}) =
//       ApprovementNewsStateError;

//   factory ApprovementNewsState.fromJson(Map<String, dynamic> json) =>
//       _$ApprovementNewsStateFromJson(json);
// }

@freezed
abstract class ApprovementNewsState with _$ApprovementNewsState {
  const factory ApprovementNewsState.loading() = ApprovementNewsStateLoading;
  const factory ApprovementNewsState.loaded({
    required List<EventEntity> listApprovmentEventEntityLoaded,
  }) = ApprovementNewsStateLoaded;
  const factory ApprovementNewsState.error({required String? errorText}) =
      ApprovementNewsStateError;
}


// /// {@template approvement_news_state_placeholder}
// /// Entity placeholder for ApprovementNewsState
// /// {@endtemplate}
// typedef ApprovementNewsEntity = List<EventEntity>;

// /// {@template approvement_news_state}
// /// ApprovementNewsState.
// /// {@endtemplate}
// sealed class ApprovementNewsState extends _$ApprovementNewsStateBase {

//   /// {@macro approvement_news_state}
//   const ApprovementNewsState({required super.data, required super.message});
//   /// Idling state
//   /// {@macro approvement_news_state}
//   const factory ApprovementNewsState.idle({
//     required ApprovementNewsEntity? data,
//     String message,
//   }) = ApprovementNewsState$Idle;

//   /// Processing
//   /// {@macro approvement_news_state}
//   const factory ApprovementNewsState.processing({
//     required ApprovementNewsEntity? data,
//     String message,
//   }) = ApprovementNewsState$Processing;

//   /// Successful
//   /// {@macro approvement_news_state}
//   const factory ApprovementNewsState.successful({
//     required ApprovementNewsEntity? data,
//     String message,
//   }) = ApprovementNewsState$Successful;

//   /// An error has occurred
//   /// {@macro approvement_news_state}
//   const factory ApprovementNewsState.error({
//     required ApprovementNewsEntity? data,
//     String message,
//   }) = ApprovementNewsState$Error;
// }

// /// Idling state
// /// {@nodoc}
// final class ApprovementNewsState$Idle extends ApprovementNewsState with _$ApprovementNewsState {
//   /// {@nodoc}
//   const ApprovementNewsState$Idle({required super.data, super.message = 'Idling'});
// }

// /// Processing
// /// {@nodoc}
// final class ApprovementNewsState$Processing extends ApprovementNewsState with _$ApprovementNewsState {
//   /// {@nodoc}
//   const ApprovementNewsState$Processing({required super.data, super.message = 'Processing'});
// }

// /// Successful
// /// {@nodoc}
// final class ApprovementNewsState$Successful extends ApprovementNewsState with _$ApprovementNewsState {
//   /// {@nodoc}
//   const ApprovementNewsState$Successful({required super.data, super.message = 'Successful'});
// }

// /// Error
// /// {@nodoc}
// final class ApprovementNewsState$Error extends ApprovementNewsState with _$ApprovementNewsState {
//   /// {@nodoc}
//   const ApprovementNewsState$Error({required super.data, super.message = 'An error has occurred.'});
// }

// /// {@nodoc}
// base mixin _$ApprovementNewsState on ApprovementNewsState {}

// /// Pattern matching for [ApprovementNewsState].
// typedef ApprovementNewsStateMatch<R, S extends ApprovementNewsState> = R Function(S state);

// /// {@nodoc}
// @immutable
// abstract base class _$ApprovementNewsStateBase {
//   /// {@nodoc}
//   const _$ApprovementNewsStateBase({required this.data, required this.message});

//   /// Data entity payload.
//   @nonVirtual
//   final ApprovementNewsEntity? data;

//   /// Message or state description.
//   @nonVirtual
//   final String message;

//   /// Has data?
//   bool get hasData => data != null;

//   /// If an error has occurred?
//   bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

//   /// Is in progress state?
//   bool get isProcessing => maybeMap<bool>(orElse: () => false, processing: (_) => true);

//   /// Is in idle state?
//   bool get isIdling => !isProcessing;

//   /// Pattern matching for [ApprovementNewsState].
//   R map<R>({
//     required ApprovementNewsStateMatch<R, ApprovementNewsState$Idle> idle,
//     required ApprovementNewsStateMatch<R, ApprovementNewsState$Processing> processing,
//     required ApprovementNewsStateMatch<R, ApprovementNewsState$Successful> successful,
//     required ApprovementNewsStateMatch<R, ApprovementNewsState$Error> error,
//   }) =>
//       switch (this) {
//         final ApprovementNewsState$Idle s => idle(s),
//         final ApprovementNewsState$Processing s => processing(s),
//         final ApprovementNewsState$Successful s => successful(s),
//         final ApprovementNewsState$Error s => error(s),
//         _ => throw AssertionError(),
//       };

//   /// Pattern matching for [ApprovementNewsState].
//   R maybeMap<R>({
//     required R Function() orElse, ApprovementNewsStateMatch<R, ApprovementNewsState$Idle>? idle,
//     ApprovementNewsStateMatch<R, ApprovementNewsState$Processing>? processing,
//     ApprovementNewsStateMatch<R, ApprovementNewsState$Successful>? successful,
//     ApprovementNewsStateMatch<R, ApprovementNewsState$Error>? error,
//   }) =>
//       map<R>(
//         idle: idle ?? (_) => orElse(),
//         processing: processing ?? (_) => orElse(),
//         successful: successful ?? (_) => orElse(),
//         error: error ?? (_) => orElse(),
//       );

//   /// Pattern matching for [ApprovementNewsState].
//   R? mapOrNull<R>({
//     ApprovementNewsStateMatch<R, ApprovementNewsState$Idle>? idle,
//     ApprovementNewsStateMatch<R, ApprovementNewsState$Processing>? processing,
//     ApprovementNewsStateMatch<R, ApprovementNewsState$Successful>? successful,
//     ApprovementNewsStateMatch<R, ApprovementNewsState$Error>? error,
//   }) =>
//       map<R?>(
//         idle: idle ?? (_) => null,
//         processing: processing ?? (_) => null,
//         successful: successful ?? (_) => null,
//         error: error ?? (_) => null,
//       );

//   @override
//   int get hashCode => data.hashCode;

//   @override
//   bool operator ==(Object other) => identical(this, other);
// }
