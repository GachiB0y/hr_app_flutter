part of 'service_bloc.dart';

/// Business Logic Component Service Events
@freezed
class ServiceEvent with _$ServiceEvent {
  const ServiceEvent._();

  /// Create
  // const factory ServiceEvent.create({required ItemData itemData}) = CreateServiceEvent;

  /// Fetch
  const factory ServiceEvent.fetch() = FetchServiceEvent;

  /// Update
  // const factory ServiceEvent.update({required Item item}) = UpdateServiceEvent;

  /// Delete
  // const factory ServiceEvent.delete({required Item item}) = DeleteServiceEvent;
}
