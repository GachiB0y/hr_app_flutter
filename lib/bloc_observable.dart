import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    log('onEvent -- bloc:${bloc.runtimeType}, event:$event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('onChange -- bloc:${bloc.runtimeType}, change:$change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('onError -- bloc:${bloc.runtimeType}, error:$error');
  }
}
