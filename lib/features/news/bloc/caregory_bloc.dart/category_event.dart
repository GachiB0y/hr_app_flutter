part of 'category_bloc.dart';

// @freezed
// class CategoryEvent with _$CategoryEvent {
//   const factory CategoryEvent.fetch() = CategoryEventFetch;
// }

/// Business Logic Component Category Events
@freezed
class CategoryEvent with _$CategoryEvent {
  const CategoryEvent._();

  /// Fetch
  const factory CategoryEvent.fetch() = FetchCategoryEvent;
}
