import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppScreenViewState {
  bool modalOpened = false;
  MainAppScreenViewState({
    required this.modalOpened,
  });

  MainAppScreenViewState copyWith({
    bool? modalOpened,
  }) {
    return MainAppScreenViewState(
      modalOpened: modalOpened ?? this.modalOpened,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_modalOpened': modalOpened,
    };
  }

  factory MainAppScreenViewState.fromMap(Map<String, dynamic> map) {
    return MainAppScreenViewState(
      modalOpened: map['_modalOpened'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainAppScreenViewState.fromJson(String source) =>
      MainAppScreenViewState.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MainAppScreenViewState(_modalOpened: $modalOpened)';

  @override
  bool operator ==(covariant MainAppScreenViewState other) {
    if (identical(this, other)) return true;

    return other.modalOpened == modalOpened;
  }

  @override
  int get hashCode => modalOpened.hashCode;
}

class MainAppScreenViewCubit extends Cubit<MainAppScreenViewState> {
  MainAppScreenViewCubit()
      : super(MainAppScreenViewState(modalOpened: false)) {}

  Future<void> changeVisibleBottomBar(bool value) async {
    final newState = state.copyWith(modalOpened: value);
    emit(newState);
  }
}
