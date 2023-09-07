import 'package:hr_app_flutter/domain/api_client/event_entity_api_client.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/event_entity.dart';

abstract class EventEntityRepository {
  Future<List<EventEntity>> getEvents({required String accessToken});
}

class EventEntityRepositoryImpl implements EventEntityRepository {
  EventEntityRepositoryImpl({
    required EventsEntityProvider eventEntityProvider,
  }) : _eventEntityProvider = eventEntityProvider;

  final EventsEntityProvider _eventEntityProvider;

  @override
  Future<List<EventEntity>> getEvents({required String accessToken}) {
    return _eventEntityProvider.getEvents(accessToken: accessToken);
  }
}
