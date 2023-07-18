// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hr_app_flutter/domain/entity/event_entity.dart';

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

abstract class EventEntityApi {
  List<EventEntity> getEvents();
}

class EventEntityCubit extends Cubit<EventEntityState> {
  final EventEntityApi apiClientEventEntity;
  EventEntityCubit({required this.apiClientEventEntity})
      : super(EventEntityState(
            listItems: [],
            eventsActual: [],
            tabs: ['Актуальное', 'Новости', 'Сотрудники', 'Мероприятия'])) {
    loadEventsList();
  }

  void loadEventsList() async {
    final res = await apiClientEventEntity.getEvents();
    final newState = state.copyWith(listItems: res);
    emit(newState);
  }

  void changeVisibleEvents({required int index}) {
    state.eventsActual.clear();
    final newEventActual = state.eventsActual.toList();
    for (var element in state.itemsGet) {
      if (element.tags.contains(state.tabs[index])) {
        newEventActual.add(element);
      }
    }
    print(state.copyWith(eventsActual: newEventActual));
    final newState = state.copyWith(eventsActual: newEventActual);
    emit(newState);
  }

  void addItem() {
    List<EventEntity> newEventEntityList = [];
    final newEvent = EventEntity(
        title: 'Заголовок 8',
        description: 'Мероприятия - Сотрудники  8',
        imagePath:
            'https://dari.me/wp-content/uploads/2020/04/baidarki-darimechti-1.jpg',
        dateFrom: DateTime.now(),
        dateTo: DateTime.now().subtract(Duration(days: 1)),
        tags: ['Мероприятия', 'Соотрудники']);
    newEventEntityList = state._listItems.toList();
    newEventEntityList.add(newEvent);

    final newState = state.copyWith(listItems: newEventEntityList);
    emit(newState);
    // events = newEventEntityList;
  }
  // void incrementDishes(int idDishes) {
  //   final List<CitchenElement> dishes = state.itemsGet;
  //   for (var element in dishes) {
  //     if (element.id == idDishes) {
  //       if (element.count >= 0) {
  //         element.count++;
  //         final newState = state.copyWith(listItems: dishes);
  //         emit(newState);
  //       }
  //     }
  //   }
  // }
}
