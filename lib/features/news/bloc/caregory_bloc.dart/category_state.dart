part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.loading() = CategoryStateLoading;
  const factory CategoryState.loaded(
      {required List<Category> listCategoryLoaded}) = CategoryStateLoaded;
  const factory CategoryState.error() = CategoryStateError;

  factory CategoryState.fromJson(Map<String, dynamic> json) =>
      _$CategoryStateFromJson(json);
}
