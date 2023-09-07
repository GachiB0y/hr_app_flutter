import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/entity/event_entity/event_entity.dart';
import 'package:hr_app_flutter/domain/repository/event_entity_repo.dart';

class EventEntityState {
  List<EventEntity> _listItems = [];
  List<EventEntity> eventsActual = [];
  final List<String> tabs = [
    'Актуальное',
    'Новости',
    'Сотрудники',
    'Мероприятия'
  ];
  List<EventEntity> get itemsGet => _listItems;
  set itemSet(EventEntity val) => _listItems.add(val);

  EventEntityState({
    required List<EventEntity> listItems,
    required List<EventEntity> eventsActual,
    required List<String> tabs,
  })  : _listItems = listItems,
        eventsActual = eventsActual;

  EventEntityState copyWith({
    List<EventEntity>? listItems,
    List<EventEntity>? eventsActual,
    List<String>? tabs,
  }) {
    return EventEntityState(
      listItems: listItems ?? this._listItems,
      eventsActual: eventsActual ?? this.eventsActual,
      tabs: tabs ?? this.tabs,
    );
  }

  @override
  bool operator ==(covariant EventEntityState other) {
    if (identical(this, other)) return true;

    return listEquals(other._listItems, _listItems) &&
        listEquals(other.eventsActual, eventsActual);
  }

  @override
  int get hashCode => _listItems.hashCode ^ eventsActual.hashCode;
}

class EventEntityCubit extends Cubit<EventEntityState> {
  final EventEntityRepository eventEntityRepository;
  EventEntityCubit({required this.eventEntityRepository})
      : super(EventEntityState(
            listItems: [],
            eventsActual: [],
            tabs: ['Актуальное', 'Новости', 'Сотрудники', 'Мероприятия'])) {
    loadEventsList();
  }

  Future<void> loadEventsList() async {
    final res = await eventEntityRepository.getEvents(accessToken: 'ZAGLYSHKA');
    final newState = state.copyWith(listItems: res);
    emit(newState);
    changeVisibleEvents(index: 0);
  }

  Future<void> changeVisibleEvents({required int index}) async {
    state.eventsActual.clear();
    final newEventActual = state.eventsActual.toList();

    for (var element in state.itemsGet) {
      if (element.tags.contains(state.tabs[index])) {
        newEventActual.add(element);
      }
    }

    final newState = state.copyWith(eventsActual: newEventActual);
    emit(newState);
  }

  void addItem(EventEntity newEvent) {
    List<EventEntity> newEventEntityList = [];

    newEventEntityList = state._listItems.toList();
    newEventEntityList.add(newEvent);

    final newState = state.copyWith(listItems: newEventEntityList);
    emit(newState);
  }
}
