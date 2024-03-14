part of 'category_bloc.dart';

// @freezed
// class CategoryState with _$CategoryState {
//   const factory CategoryState.loading() = CategoryStateLoading;
//   const factory CategoryState.loaded(
//       {required List<Category> listCategoryLoaded}) = CategoryStateLoaded;
//   const factory CategoryState.error() = CategoryStateError;

//   factory CategoryState.fromJson(Map<String, dynamic> json) =>
//       _$CategoryStateFromJson(json);
// }

/// {@template category_state_placeholder}
/// Entity placeholder for CategoryState
/// {@endtemplate}
typedef CategoryEntity = List<Category>;

/// {@template category_state}
/// CategoryState.
/// {@endtemplate}
sealed class CategoryState extends _$CategoryStateBase {
  /// Idling state
  /// {@macro category_state}
  const factory CategoryState.idle({
    required CategoryEntity? data,
    String message,
  }) = CategoryState$Idle;

  /// Processing
  /// {@macro category_state}
  const factory CategoryState.processing({
    required CategoryEntity? data,
    String message,
  }) = CategoryState$Processing;

  /// Successful
  /// {@macro category_state}
  const factory CategoryState.successful({
    required CategoryEntity? data,
    String message,
  }) = CategoryState$Successful;

  /// An error has occurred
  /// {@macro category_state}
  const factory CategoryState.error({
    required CategoryEntity? data,
    String message,
  }) = CategoryState$Error;

  /// {@macro category_state}
  const CategoryState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class CategoryState$Idle extends CategoryState with _$CategoryState {
  /// {@nodoc}
  const CategoryState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class CategoryState$Processing extends CategoryState
    with _$CategoryState {
  /// {@nodoc}
  const CategoryState$Processing(
      {required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class CategoryState$Successful extends CategoryState
    with _$CategoryState {
  /// {@nodoc}
  const CategoryState$Successful(
      {required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class CategoryState$Error extends CategoryState with _$CategoryState {
  /// {@nodoc}
  const CategoryState$Error(
      {required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$CategoryState on CategoryState {}

/// Pattern matching for [CategoryState].
typedef CategoryStateMatch<R, S extends CategoryState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$CategoryStateBase {
  /// {@nodoc}
  const _$CategoryStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final CategoryEntity? data;

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

  /// Pattern matching for [CategoryState].
  R map<R>({
    required CategoryStateMatch<R, CategoryState$Idle> idle,
    required CategoryStateMatch<R, CategoryState$Processing> processing,
    required CategoryStateMatch<R, CategoryState$Successful> successful,
    required CategoryStateMatch<R, CategoryState$Error> error,
  }) =>
      switch (this) {
        CategoryState$Idle s => idle(s),
        CategoryState$Processing s => processing(s),
        CategoryState$Successful s => successful(s),
        CategoryState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [CategoryState].
  R maybeMap<R>({
    CategoryStateMatch<R, CategoryState$Idle>? idle,
    CategoryStateMatch<R, CategoryState$Processing>? processing,
    CategoryStateMatch<R, CategoryState$Successful>? successful,
    CategoryStateMatch<R, CategoryState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [CategoryState].
  R? mapOrNull<R>({
    CategoryStateMatch<R, CategoryState$Idle>? idle,
    CategoryStateMatch<R, CategoryState$Processing>? processing,
    CategoryStateMatch<R, CategoryState$Successful>? successful,
    CategoryStateMatch<R, CategoryState$Error>? error,
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
