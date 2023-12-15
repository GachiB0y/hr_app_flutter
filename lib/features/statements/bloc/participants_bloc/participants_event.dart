part of 'participants_bloc.dart';

/// Business Logic Component Participants Events
@freezed
class ParticipantsEvent with _$ParticipantsEvent {
  const ParticipantsEvent._();

  /// Fetch
  const factory ParticipantsEvent.fetch({required String inputValue}) =
      FetchParticipantsEvent;
}
