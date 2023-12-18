import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/utils/bloc_observable.dart';
import 'package:hr_app_flutter/features/initialiazation/logic/di_container/di_coinatiner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/logger.dart';
import 'features/app/logic/app_runner.dart';
import 'features/initialiazation/logic/initialization_processor.dart';
import 'features/initialiazation/model/dependencies.dart';
import 'features/initialiazation/model/initialization_hook.dart';

abstract class AppFactory {
  Widget makeApp();
}

final appFactory = makeAppFactory();

// void main() {
//   Bloc.observer = const AppBlocObserver();
//   final app = appFactory.makeApp();
//   runApp(app);
// }

void main() {
  final hook = InitializationHook.setup(
    onInitializing: _onInitializing,
    onInitialized: _onInitialized,
    onError: _onError,
    onInit: _onInit,
  );
  logger.runLogging(
    () {
      runZonedGuarded(
        () => AppRunner().initializeAndRun(hook),
        logger.logZoneError,
      );
    },
    const LogOptions(),
  );
}

void _onInitializing(InitializationStepInfo info) {
  final percentage = ((info.step / info.stepsCount) * 100).toInt();
  logger.info(
    'Inited ${info.stepName} in ${info.msSpent} ms | '
    'Progress: $percentage%',
  );
}

void _onInitialized(InitializationResult result) {
  logger.info('Initialization completed successfully in ${result.msSpent} ms');
}

void _onError(int step, Object error) {
  logger.error('Initialization failed on step $step with error: $error');
}

void _onInit() {
  logger.info('Initialization started');
}
