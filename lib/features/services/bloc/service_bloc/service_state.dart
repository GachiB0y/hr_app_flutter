part of 'service_bloc.dart';

// @freezed
// class ServiceState with _$ServiceState {
//   const factory ServiceState.loading() = ServiceStateLoading;
//   const factory ServiceState.loaded({
//     required List<Service> servicesLoaded,
//     required List<dynamic> loeadedServiceWidgets,
//   }) = ServiceStateLoaded;
//   const factory ServiceState.error() = ServiceStateError;

//   factory ServiceState.fromJson(Map<String, dynamic> json) =>
//       _$ServiceStateFromJson(json);
// }

/// {@template service_state_placeholder}
/// Entity placeholder for ServiceState
/// {@endtemplate}
typedef ServiceEntity = List<Service>;

/// {@template service_state}
/// ServiceState.
/// {@endtemplate}
sealed class ServiceState extends _$ServiceStateBase {
  /// Idling state
  /// {@macro service_state}
  const factory ServiceState.idle({
    required ServiceEntity? data,
    String message,
  }) = ServiceState$Idle;

  /// Processing
  /// {@macro service_state}
  const factory ServiceState.processing({
    required ServiceEntity? data,
    String message,
  }) = ServiceState$Processing;

  /// Successful
  /// {@macro service_state}
  const factory ServiceState.successful({
    required ServiceEntity? data,
    String message,
  }) = ServiceState$Successful;

  /// An error has occurred
  /// {@macro service_state}
  const factory ServiceState.error({
    required ServiceEntity? data,
    String message,
  }) = ServiceState$Error;

  /// {@macro service_state}
  const ServiceState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class ServiceState$Idle extends ServiceState with _$ServiceState {
  /// {@nodoc}
  const ServiceState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class ServiceState$Processing extends ServiceState with _$ServiceState {
  /// {@nodoc}
  const ServiceState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class ServiceState$Successful extends ServiceState with _$ServiceState {
  /// {@nodoc}
  const ServiceState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class ServiceState$Error extends ServiceState with _$ServiceState {
  /// {@nodoc}
  const ServiceState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$ServiceState on ServiceState {}

/// Pattern matching for [ServiceState].
typedef ServiceStateMatch<R, S extends ServiceState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$ServiceStateBase {
  /// {@nodoc}
  const _$ServiceStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final ServiceEntity? data;

  /// Message or state description.
  @nonVirtual
  final String message;

  /// Has data?
  bool get hasData => data != null;

  /// If an error has occurred?
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in progress state?
  bool get isProcessing =>
      maybeMap<bool>(orElse: () => false, processing: (_) => true);

  /// Is in idle state?
  bool get isIdling => !isProcessing;

  /// Pattern matching for [ServiceState].
  R map<R>({
    required ServiceStateMatch<R, ServiceState$Idle> idle,
    required ServiceStateMatch<R, ServiceState$Processing> processing,
    required ServiceStateMatch<R, ServiceState$Successful> successful,
    required ServiceStateMatch<R, ServiceState$Error> error,
  }) =>
      switch (this) {
        ServiceState$Idle s => idle(s),
        ServiceState$Processing s => processing(s),
        ServiceState$Successful s => successful(s),
        ServiceState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [ServiceState].
  R maybeMap<R>({
    ServiceStateMatch<R, ServiceState$Idle>? idle,
    ServiceStateMatch<R, ServiceState$Processing>? processing,
    ServiceStateMatch<R, ServiceState$Successful>? successful,
    ServiceStateMatch<R, ServiceState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [ServiceState].
  R? mapOrNull<R>({
    ServiceStateMatch<R, ServiceState$Idle>? idle,
    ServiceStateMatch<R, ServiceState$Processing>? processing,
    ServiceStateMatch<R, ServiceState$Successful>? successful,
    ServiceStateMatch<R, ServiceState$Error>? error,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        successful: successful ?? (_) => null,
        error: error ?? (_) => null,
      );

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other);
}
